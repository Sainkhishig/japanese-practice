import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:japanese_practise_n5/common/common_widget.dart';
import 'package:japanese_practise_n5/common/widget/afen_text_field.dart';
import 'package:japanese_practise_n5/common/widget/register_button.dart';
import 'package:japanese_practise_n5/common/widget/save_button.dart';
import 'package:japanese_practise_n5/pages/excel_import/jlpt_word/list/jlpt_word_list_controller.dart';
import 'package:japanese_practise_n5/pages/excel_import/model/JlptWord.dart';
import 'package:file_picker/file_picker.dart';
import 'package:excel/excel.dart';

// pyfm060 : キャンセル規定一覧 BlogList
class JlptWordList extends HookConsumerWidget {
  JlptWordList({Key? key}) : super(key: key);
  AfenTextField txtColumns = AfenTextField("Эксел баганууд");
  final _database = FirebaseDatabase.instance.reference();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    PageController pageController = PageController(
      initialPage: 0,
      keepPage: true,
    );
    final controller = ref.watch(jlptWordListController.notifier);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        foregroundColor: Colors.blueGrey,
        backgroundColor: Colors.grey.shade100,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // txtColumns,
            RegisterButton(
              onClick: () {
                ref.read(jlptWordListController.notifier).clearData();
              },
            ),
          ],
        ),
      ),
      body:
          //Expanded(child: FlashCardListItem(flashcards: flashCard)),
          Column(
        children: [
          Row(children: [
            Expanded(child: txtColumns),
            SaveButton(
              onSave: () async {
                try {
                  pickExcel(context);
                  // showSuccessToastMessage(context, "Амжилттай хадгаллаа");
                } catch (ex) {
                  showErrorToastMessage(context, "Алдаа гарлаа");
                }
              },
            ),
          ]),
          StreamBuilder(
            stream: _database.child('AfenEduBlog').orderByKey().onValue,
            builder: (context, snapshot) {
              final tilesList = <Widget>[];

              if ((snapshot.data! as Event).snapshot.value != null &&
                  snapshot.hasData) {
                // final datas = (snapshot.data! as Event).snapshot;
                // print("myUserKeydatas:$datas");
                final myUsers = Map<String, dynamic>.from(
                    (snapshot.data! as Event).snapshot.value);

                myUsers.forEach((keyUser, value) {
                  print("userkey$keyUser");

                  final userTile = Container(
                    decoration: const BoxDecoration(
                        border: Border(
                            bottom:
                                BorderSide(width: 1.0, color: Colors.grey))),
                    child: ListTile(
                      leading: const Icon(Icons.verified_user),
                      title: Column(
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Text(value["title"]),
                                ),
                              ])
                        ],
                      ),
                      onTap: () {
                        // print("value:");
                        // print("value:$value");
                        var exercise = JlptWord.fromRTDB(value);
                        print("exercise:${exercise.kanji}");
                        exercise.key = keyUser;
                        controller.setDetailData(exercise);
                      },
                    ),
                  );
                  tilesList.add(userTile);
                });
              }
              return Expanded(child: ListView(children: [...tilesList]));
            },
          ),
        ],
      ),
    );
  }

  Future<void> pickExcel(BuildContext context) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    print("resultAri");
    if (result != null) {
      print("result has");

      PlatformFile file = result.files.first;
      print("file:${file.name}");
      var excel = Excel.decodeBytes(file.bytes!);

      await readJlptWordExcelByFixedColumn(file.name.split(".")[0], excel,
              txtColumns.controller.text.split(";"))
          .then((value) => {showSuccessToastMessage(context, "amjilltai")})
          .onError((error, stackTrace) =>
              {showErrorToastMessage(context, "aldaa garlaa")});
    } else {
      // User canceled the picker
    }
  }

  readJlptWordExcelByFixedColumn(
      String dbName, Excel excel, List<String> columns) async {
    print("dbName");
    print(dbName);
    for (var file in excel.sheets.values) {
      // var sheetName = file.sheetName.split("-")[1];

      // var sectionName = file.sheetName.split("-")[2];
      print("Start");
      for (var i = 0; i < excel.tables[file.sheetName]!.rows.length; i++) {
        var row = excel.tables[file.sheetName]!.rows[i];

        final newData = <String, dynamic>{};
        print("1");
        for (var i = 1; i < columns.length; i++) {
          newData["level"] = int.parse(getCellValue(row[0]));
          newData[columns[i]] = getCellValue(row[i]);
          newData["order"] = i;
          newData["time"] = DateTime.now().microsecondsSinceEpoch;
        }
        // final newData = <String, dynamic>{
        //   'bookName': file.sheetName,
        //   'bookNumber': int.parse(bookNumber),
        //   'section': sectionName,
        //   'answerSheet': lstQUestion.map((question) => {
        //         'section': question.section,
        //         'isGroup': question.isGroup,
        //         'questionNumber': question.questionNumber,
        //         'groupQuestionEndNumber': question.groupQuestionEndNumber,
        //         'answerType': question.answerType.name,
        //         'questionContent': question.questionContent,
        //         'answerChoice': question.answerChoice,
        //         'answers': question.answers
        //       }),
        //   'time': DateTime.now().microsecondsSinceEpoch
        // };
        print("2");
        // await _database
        //     .child(dbName.split("-")[0])
        //     .push()
        //     .set(newData)
        //     .catchError((onError) {
        //   print('could not saved data');
        //   throw ("aldaa garlaa");
        // });
        await _database
            .child("${dbName.split("-")[0]}/${getCellValue(row[1])}")
            .set(newData)
            .catchError((onError) {
          print('could not saved data');
          throw ("aldaa garlaa");
        });
      }
    }
  }

  // Future readExcesl(Excel excel) async {
  //   final _database = FirebaseDatabase.instance.reference();

  //   for (var file in excel.sheets.values
  //       .where((element) => element.sheetName.startsWith("Cambridge"))) {
  //     // var sheetName = file.sheetName.split("-")[1];

  //     var bookNumber = file.sheetName.split("-")[1];
  //     var sectionName = file.sheetName.split("-")[2];
  //     print(sectionName);
  //     List<IeltsQuestion> lstQUestion = [];
  //     for (var i = 0; i < excel.tables[file.sheetName]!.rows.length; i++) {
  //       var row = excel.tables[file.sheetName]!.rows[i];
  //       print("row:${getCellValue(row[7])}");
  //       // int trueAnswerIndex = int.parse(getCellValue(row[5]));
  //       // var cambridgeIeltsIndex = getCellValue(row[0]);
  //       var question = IeltsQuestion.empty()
  //         ..section = getCellValue(row[0])
  //         ..isGroup = getCellValue(row[1]).isNotEmpty
  //         ..questionNumber = int.parse(getCellValue(row[2]))
  //         ..groupQuestionEndNumber = getCellValue(row[3]).isEmpty
  //             ? null
  //             : int.parse(getCellValue(row[3]))
  //         ..answerType = AnswerType
  //             .singleSelect // AnswerType.values.byName(getCellValue(row[4]))
  //         ..questionContent = getCellValue(row[5])
  //         ..answerChoice = getCellValue(row[6]).split(";")
  //         ..answers = getCellValue(row[7]).split(";");
  //       lstQUestion.add(question);
  //       print("answers");
  //       print(getCellValue(row[7]));
  //       print(getCellValue(row[8]));

  //       print(question.answers);
  //       final newData = <String, dynamic>{
  //         'bookName': file.sheetName,
  //         'bookNumber': int.parse(bookNumber),
  //         'section': sectionName,
  //         'answerSheet': lstQUestion.map((question) => {
  //               'section': question.section,
  //               'isGroup': question.isGroup,
  //               'questionNumber': question.questionNumber,
  //               'groupQuestionEndNumber': question.groupQuestionEndNumber,
  //               'answerType': question.answerType.name,
  //               'questionContent': question.questionContent,
  //               'answerChoice': question.answerChoice,
  //               'answers': question.answers
  //             }),
  //         'time': DateTime.now().microsecondsSinceEpoch
  //       };

  //       await _database
  //           .child('IeltsAnswerSheet')
  //           .push()
  //           .set(newData)
  //           .catchError((onError) {
  //         print('could not saved data');
  //         throw ("aldaa garlaa");
  //       });
  //     }
  //   }
  // }

  String getCellValue(Data? row) {
    return row == null
        ? ""
        : row.value == null
            ? ""
            : "${row.value}";
  }
}
