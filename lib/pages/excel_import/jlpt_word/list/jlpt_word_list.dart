import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:japanese_practise_n5/classes/test_excel_model.dart';
import 'package:japanese_practise_n5/common/common_widget.dart';
import 'package:japanese_practise_n5/common/widget/afen_text_field.dart';
import 'package:japanese_practise_n5/common/widget/register_button.dart';
import 'package:japanese_practise_n5/common/widget/save_button.dart';
import 'package:japanese_practise_n5/pages/excel_import/jlpt_word/list/jlpt_word_list_controller.dart';
import 'package:japanese_practise_n5/pages/excel_import/model/JlptWord.dart';
import 'package:file_picker/file_picker.dart';
import 'package:excel/excel.dart';
import 'package:japanese_practise_n5/pages/listening/model/listening_model.dart';
import 'package:japanese_practise_n5/pages/reading/model/reading_model.dart';

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
          ]),
          Container(
              padding: const EdgeInsets.all(8.0),
              width: 200,
              child: ElevatedButton(
                child: const Text("Динамик багана"),
                onPressed: () async {
                  try {
                    pickExcel(context, ImportType.dynamicCol);
                    // showSuccessToastMessage(context, "Амжилттай хадгаллаа");
                  } catch (ex) {
                    showErrorToastMessage(context, "Алдаа гарлаа");
                  }
                },
              )),
          Container(
              padding: const EdgeInsets.all(8.0),
              width: 200,
              child: ElevatedButton(
                child: const Text("Тест: уншлага"),
                onPressed: () async {
                  try {
                    pickExcel(context, ImportType.readingTest);
                    // showSuccessToastMessage(context, "Амжилттай хадгаллаа");
                  } catch (ex) {
                    showErrorToastMessage(context, "Алдаа гарлаа");
                  }
                },
              )),
          Container(
              padding: const EdgeInsets.all(8.0),
              width: 200,
              child: ElevatedButton(
                child: const Text("Тест: Дүрэм, шинэ үг"),
                onPressed: () async {
                  try {
                    pickExcel(context, ImportType.vocabularyGrammarTest);
                    // showSuccessToastMessage(context, "Амжилттай хадгаллаа");
                  } catch (ex) {
                    showErrorToastMessage(context, "Алдаа гарлаа");
                  }
                },
              )),
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

  Future<void> pickExcel(BuildContext context, ImportType importType) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    print("resultAri");
    if (result != null) {
      print("result has");

      PlatformFile file = result.files.first;
      print("file:${file.name}");
      var excel = Excel.decodeBytes(file.bytes!);
      switch (importType) {
        case ImportType.readingTest:
          await readJlptReadingTest(txtColumns.controller.text, excel)
              .then((value) => {showSuccessToastMessage(context, "amjilltai")})
              .onError((error, stackTrace) =>
                  {showErrorToastMessage(context, "aldaa garlaa")});
          break;
        case ImportType.vocabularyGrammarTest:
          await readJlptWordExcelByFixedColumn(file.name.split(".")[0], excel,
                  txtColumns.controller.text.split(";"))
              .then((value) => {showSuccessToastMessage(context, "amjilltai")})
              .onError((error, stackTrace) =>
                  {showErrorToastMessage(context, "aldaa garlaa")});
          break;
        case ImportType.dynamicCol:
          await readJlptTestExcelByFixedColumn(
                  txtColumns.controller.text, excel)
              .then((value) => {showSuccessToastMessage(context, "amjilltai")})
              .onError((error, stackTrace) =>
                  {showErrorToastMessage(context, "aldaa garlaa")});
          break;
        default:
      }

//voc, kanji, grammar

    } else {
      // User canceled the picker
    }
  }

// col: question answers

  // Future readXlKanjiTest(xlName) async {
  //   List<XlTestExerciseModel> lstTestData = [];
  //   List<String> vocabularies = ["ШИНЭ ҮГ"];
  //   ByteData data = await rootBundle.load("test/$xlName.xlsx");
  //   var bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
  //   var excel = Excel.decodeBytes(bytes);

  //   for (var i = 1; i < excel.tables["Sheet1"]!.rows.length; i++) {
  //     var row = excel.tables["Sheet1"]!.rows[i];

  //     int trueAnswerIndex = int.parse(getCellValue(row[5]));

  //     List<XlTestAnswersModel> lstAnswers = [];
  //     for (var i = 1; i < 5; i++) {
  //       var answer = XlTestAnswersModel()
  //         ..answer = getCellValue(row[i])
  //         ..isTrue = trueAnswerIndex == i;
  //       lstAnswers.add(answer);
  //     }
  //     var vocabulary = XlTestExerciseModel()
  //       ..question = getCellValue(row[0])
  //       ..answers = lstAnswers;

  //     lstTestData.add(vocabulary);
  //   }

  //   final newData = <String, dynamic>{
  //     'jlptLevel': jlptLevel,
  //     'name': xlName,
  //     'reference': "",
  //     'exercises': lstTestData.map((test) => {
  //           'question': test.question,
  //           'answers': test.answers.map((quest) => {
  //                 'answer': quest.answer,
  //                 'isTrue': quest.isTrue,
  //               }),
  //         }),
  //     'vocabularies': vocabularies,
  //     'time': DateTime.now().microsecondsSinceEpoch
  //   };

  //   await _database
  //       .child('KanjiTest')
  //       .push()
  //       .set(newData)
  //       .catchError((onError) {
  //     print('could not saved data');
  //     throw ("aldaa garlaa");
  //   });
  // }

  readJlptTestExcelByFixedColumn(String dbName, Excel excel) async {
    print("dbName:$dbName");
    List<String> vocabularies = [""];
    for (var file in excel.sheets.values) {
      if (file.sheetName.contains("formula")) continue;
      print("Sheet:${file.sheetName}");
      List<XlTestExerciseModel> lstExercise = [];
      final newData = <String, dynamic>{};
      for (var j = 2; j < excel.tables[file.sheetName]!.rows.length; j++) {
        print("row:$j");
        var row = excel.tables[file.sheetName]!.rows[j];
        int trueAnswerIndex = int.parse(getCellValue(row[5]));

        List<XlTestAnswersModel> lstAnswers = [];
        for (var i = 1; i < 5; i++) {
          var answer = XlTestAnswersModel()
            ..answer = getCellValue(row[i])
            ..isTrue = trueAnswerIndex == i;
          lstAnswers.add(answer);
        }
        var exercise = XlTestExerciseModel()
          ..question = getCellValue(row[0])
          ..answers = lstAnswers;

        lstExercise.add(exercise);

        newData["jlptLevel"] = 5;
        newData["name"] =
            getCellValue(excel.tables[file.sheetName]!.rows[0][0]);
        newData["reference"] =
            getCellValue(excel.tables[file.sheetName]!.rows[1][0]);
        newData["exercises"] = lstExercise.map((ex) => {
              'question': ex.question,
              'answers': ex.answers.map((quest) => {
                    'answer': quest.answer,
                    'isTrue': quest.isTrue,
                  }),
            });
        newData["vocabularies"] = [];
        newData["time"] = DateTime.now().microsecondsSinceEpoch;
      }
      print("newData:$newData");
      await _database.child(dbName).push().set(newData).catchError((onError) {
        print('could not saved data');
        throw ("aldaa garlaa");
      });
    }
  }

//listening Test
  readJlptListeningTestWithSpecCol(
      String dbName, Excel excel, List<String> columns) async {
    print("dbName");
    print(dbName);
    for (var file in excel.sheets.values) {
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

// read grammar kanji vocabulary
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

  // Future<void> writeNew(String key, String exerciseName,
  //     List<ReadingDetailItem> lstExercises, List<String> vocabularies) async {
  //   List<Reading> lstReadingExercises = [];
  //   for (var readingEx in lstExercises) {
  //     var section = readingEx.txtName.controller.text;
  //     var content = readingEx.txtContent.controller.text;
  //     var questions = readingEx.lstQuestionWidgets.lstQuestion
  //         .map((question) => Question(
  //               question.questionWidget.controller.text,
  //               question.answerWidget.lstAnswer
  //                   .map((e) => AnswerOption(
  //                       e.field.controller.text, e.checkField.isChecked))
  //                   .toList(),
  //             ))
  //         .toList();

  //     Reading reading = Reading(section, content, questions);
  //     lstReadingExercises.add(reading);
  //   }

  //   List<Map<String, dynamic>> lstSendItem = [];
  //   lstReadingExercises.map((e) {
  //     lstSendItem.add({
  //       'section': e.section,
  //       'content': e.content,
  //       'questions': e.questions.map((quest) => {
  //             'question': quest.question,
  //             'answers': quest.answers.map((quest) => {
  //                   'answer': quest.answer,
  //                   'isTrue': quest.isTrue,
  //                 }),
  //           }),
  //     });
  //   }).toList();

  //   final newData = <String, dynamic>{
  //     'jlptLevel': jlptLevel,
  //     'name': exerciseName,
  //     'exercises': lstSendItem,
  //     'vocabularies': vocabularies,
  //     'time': DateTime.now().microsecondsSinceEpoch
  //   };
  //   if (key.isEmpty) {
  //     await _database
  //         .child('ReadingTest')
  //         .push()
  //         .set(newData)
  //         .catchError((onError) {
  //       print('could not saved data');
  //       throw ("aldaa garlaa");
  //     });
  //   } else {
  //     var _todoQuery = _database.child("/ReadingTest");
  //     await _todoQuery.child("/$key").set(newData).catchError((onError) {
  //       print('could not update data');
  //       throw ("aldaa garlaa");
  //     });
  //   }
  // }
//reading TestExcel

  // readJlptReadingTestExcel(String dbName, Excel excel) async {
  //   print("jlptLevel:$dbName");
  //   ReadingSourceState sourceState = ReadingSourceState.title;
  //   List<String> vocabularies = ["new word"];
  //   List<Reading> lstReadingExercises = [];
  //   Reading currentReading = Reading.empty();
  //   Question currentQuestion = Question.empty();
  //   List<Question> lstQuestion = [];
  //   for (var file in excel.sheets.values) {
  //     if (file.sheetName.contains("formula")) continue;
  //     print("Sheet:${file.sheetName}");

  //     // List<Question> lstQuestions = [];

  //     String exerciseName = "";
  //     for (var j = 1; j < excel.tables[file.sheetName]!.rows.length; j++) {
  //       var row = excel.tables[file.sheetName]!.rows[j];

  //       var rowFirstValue = getCellValue(row[0]);
  //       if (rowFirstValue.startsWith("JLPT")) {
  //         print("j*+$j");
  //         if (j != 1) {
  //           print("pass:$lstReadingExercises");

  //           List<Map<String, dynamic>> lstSendItem = [];
  //           lstReadingExercises.map((e) {
  //             lstSendItem.add({
  //               'section': e.section,
  //               'content': e.content,
  //               'questions': e.questions.map((quest) => {
  //                     'question': quest.question,
  //                     'answers': quest.answers.map((quest) => {
  //                           'answer': quest.answer,
  //                           'isTrue': quest.isTrue,
  //                         }),
  //                   }),
  //             });
  //           }).toList();

  //           final newData = <String, dynamic>{
  //             'jlptLevel': 5,
  //             'name': exerciseName,
  //             'exercises': lstSendItem,
  //             'vocabularies': vocabularies,
  //             'time': DateTime.now().microsecondsSinceEpoch
  //           };
  //           print("newData");
  //           print(newData);
  //           await _database
  //               .child(dbName)
  //               .push()
  //               .set(newData)
  //               .catchError((onError) {
  //             print('could not saved data');
  //             throw ("aldaa garlaa");
  //           });
  //         }

  //         lstReadingExercises = [];

  //         exerciseName = rowFirstValue;
  //         continue;
  //       }
  //       if (rowFirstValue.startsWith("Reading")) {
  //         if (sourceState == ReadingSourceState.answers) {
  //           // var lst = [...lstQuestion];
  //           print("q::${lstQuestion.length}");
  //           currentReading.questions = lstQuestion.toList();

  //           lstReadingExercises.add(currentReading);
  //         }
  //         print("currentReading:$currentReading");
  //         currentReading = Reading.empty();
  //         currentReading.section = rowFirstValue;
  //         currentReading.questions = [];
  //         sourceState = ReadingSourceState.section;
  //         continue;
  //         // questions = XlTestExerciseModel();
  //       }
  //       if (rowFirstValue.startsWith("Question")) {
  //         if (sourceState == ReadingSourceState.answers) {
  //           print("questionAdd");
  //           lstQuestion.add(
  //               Question(currentQuestion.question, currentQuestion.answers));
  //         }
  //         currentQuestion = Question.empty();
  //         currentQuestion.question = rowFirstValue;
  //         sourceState = ReadingSourceState.question;
  //         continue;
  //       }
  //       if (rowFirstValue.startsWith("Answers")) {
  //         sourceState = ReadingSourceState.answers;
  //         continue;
  //       }
  //       if (rowFirstValue.contains("Key")) {
  //         if (sourceState == ReadingSourceState.answers) {
  //           print("questionAdd2");
  //           lstQuestion.add(
  //               Question(currentQuestion.question, currentQuestion.answers));
  //           lstReadingExercises.add(currentReading);
  //         }
  //         sourceState = ReadingSourceState.trueAnswer;
  //         continue;
  //       }

  //       switch (sourceState) {
  //         case ReadingSourceState.section:
  //           print("content:$rowFirstValue");
  //           currentReading.content += "\n" + rowFirstValue;
  //           break;
  //         case ReadingSourceState.answers:
  //           currentQuestion.answers.add(AnswerOption(rowFirstValue, false));
  //           break;
  //         case ReadingSourceState.trueAnswer:
  //           var questionIndex =
  //               int.parse(rowFirstValue.split(":")[0].trim()) - 1;
  //           var trueAnswerIndex =
  //               int.parse(rowFirstValue.split(":")[1].trim()) - 1;
  //           // currentQuestion.answers[trueAnswerIndex].isTrue = true;
  //           // if (questionIndex == currentReading.questions.length) {
  //           // print("questonLength${currentReading.questions.length}");
  //           // print("questionIndex${questionIndex}");
  //           // print(
  //           //     "answers${currentReading.questions[questionIndex].answers.length}");
  //           // print("trueAnswerIndex$trueAnswerIndex");
  //           // currentReading.questions[questionIndex].answers[trueAnswerIndex]
  //           //     .isTrue = true;
  //           // }
  //           break;
  //         default:
  //       }
  //     }
  //   }
  // }

  saveReadingTest(dbName, exerciseName, lstReadingExercises) async {
    List<Map<String, dynamic>> lstSendItem = [];
    lstReadingExercises.map((e) {
      lstSendItem.add({
        'section': e.section,
        'content': e.content,
        'questions': e.questions.map((quest) => {
              'question': quest.question,
              'answers': quest.answers.map((quest) => {
                    'answer': quest.answer,
                    'isTrue': quest.isTrue,
                  }),
            }),
      });
    }).toList();

    final newData = <String, dynamic>{
      'jlptLevel': 5,
      'name': exerciseName,
      'exercises': lstSendItem,
      'vocabularies': ["vocabularies"],
      'time': DateTime.now().microsecondsSinceEpoch
    };
    print("newData");
    print(newData);
    await _database.child(dbName).push().set(newData).catchError((onError) {
      print('could not saved data');
      throw ("aldaa garlaa");
    });
  }

  setAnswerKey(List<Reading> lstExercise, Map<int, int> mapAnswerKey) {
    print("lstAnswers:$mapAnswerKey");
    for (var readingPassage in lstExercise) {
      readingPassage.questions.asMap().forEach((indexs, question) {
        var questionIndex = int.parse(question.question.split(".")[0].trim());
        var trueAnswerIndex = mapAnswerKey[questionIndex] ?? 0;
        debugPrint(
            'IndexVal:::$indexs : question:$questionIndex:answer:$trueAnswerIndex');
        question.answers[trueAnswerIndex - 1].isTrue = true;
      });
    }
  }

  saveListeningTest(int jlptLevel, String exName, StringstoragePath,
      ListeningExercise listeningTest) async {
    final newData = <String, dynamic>{
      'jlptLevel': listeningTest.jlptLevel,
      'name': listeningTest.name,
      'storagePath': listeningTest.storagePath,
      'exercises': listeningTest.exercises.map((quest) => {
            'question': quest.question,
            'audioUrl': quest.audioUrl ?? "",
            'audioPath': quest.audioPath ?? "",
            'imageUrl': quest.imageUrl ?? "",
            'imagePath': quest.imagePath ?? "",
            'answers': quest.answers.map((answerChoise) => {
                  'answer': answerChoise.answer,
                  'isTrue': answerChoise.isTrue,
                }),
          }),
      'vocabularies': ["vocabularies"],
      'time': DateTime.now().microsecondsSinceEpoch
    };
    await _database
        .child('ListeningTest')
        .push()
        .set(newData)
        .catchError((onError) {
      print('could not saved data');
      throw ("aldaa garlaa");
    });
  }

  readJlptReadingTest(String dbName, Excel excel) async {
    ReadingSourceState sourceState = ReadingSourceState.title;
    List<Reading> lstReadingExercises = [];
    Reading currentReading = Reading.empty();
    Map<int, int> mapAnswerKey = {};

    Question currentQuestion = Question.empty();
    for (var file in excel.sheets.values) {
      if (file.sheetName.contains("formula")) continue;

      String exerciseName = "";
      for (var j = 1; j < excel.tables[file.sheetName]!.rows.length; j++) {
        var row = excel.tables[file.sheetName]!.rows[j];
        var rowFirstValue = getCellValue(row[0]);
        if (rowFirstValue.startsWith("JLPT")) {
          lstReadingExercises = [];
          mapAnswerKey = {};
          exerciseName = rowFirstValue;
          continue;
        } else if (rowFirstValue.startsWith("Reading")) {
          currentReading = Reading.empty();
          currentReading.section = rowFirstValue;
          sourceState = ReadingSourceState.section;
          continue;
        } else if (rowFirstValue.startsWith("Question")) {
          currentQuestion = Question.empty();
          currentQuestion.question =
              rowFirstValue.replaceAll("Question", "").trim();
          sourceState = ReadingSourceState.question;
          continue;
        } else if (rowFirstValue.startsWith("end question")) {
          currentReading.questions
              .add(Question(currentQuestion.question, currentQuestion.answers));
          continue;
        } else if (rowFirstValue.startsWith("end passage")) {
          lstReadingExercises.add(currentReading);
        } else if (rowFirstValue.startsWith("Answer Key")) {
          sourceState = ReadingSourceState.answerKey;
          continue;
        } else if (rowFirstValue.startsWith("endJLPT")) {
          setAnswerKey(lstReadingExercises, mapAnswerKey);
          await saveReadingTest(dbName, exerciseName, lstReadingExercises);
        } else {
          switch (sourceState) {
            case ReadingSourceState.section:
              currentReading.content += "\n" + rowFirstValue;
              break;
            case ReadingSourceState.question:
              currentQuestion.answers.add(AnswerOption(rowFirstValue, false));
              break;
            case ReadingSourceState.answerKey:
              var questionIndex = int.parse(rowFirstValue.split(":")[0].trim());
              var trueAnswerIndex =
                  int.parse(rowFirstValue.split(":")[1].trim());
              mapAnswerKey[questionIndex] = trueAnswerIndex;
              break;
            default:
          }
        }
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

enum ReadingSourceState { title, section, question, answerKey }
enum ImportType { readingTest, vocabularyGrammarTest, dynamicCol }
