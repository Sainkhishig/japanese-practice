import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:japanese_practise_n5/common/common_widget.dart';
import 'package:japanese_practise_n5/common/widget/afen_text_field.dart';
import 'package:japanese_practise_n5/common/widget/register_button.dart';
import 'package:japanese_practise_n5/pages/grammar/detail/grammar_detail_controller.dart';
import 'package:japanese_practise_n5/pages/grammar/list/grammar_list_controller.dart';
import 'package:japanese_practise_n5/pages/grammar/model/grammar_model.dart';
import 'package:file_picker/file_picker.dart';
import 'package:excel/excel.dart';

// pyfm060 : キャンセル規定一覧 GrammarList
class GrammarList extends HookConsumerWidget {
  GrammarList({Key? key}) : super(key: key);
  AfenTextField txtExerciseName = AfenTextField("Эксел нэр");
  final _database = FirebaseDatabase.instance.reference();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    PageController pageController = PageController(
      initialPage: 0,
      keepPage: true,
    );
    final controller = ref.watch(grammarListController.notifier);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        foregroundColor: Colors.blueGrey,
        backgroundColor: Colors.grey.shade100,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RegisterButton(
              onClick: () {
                ref.read(grammarListController.notifier).clearData();
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Row(children: [
            Expanded(child: txtExerciseName),
            RegisterButton(
              onClick: () async {
                try {
                  await ref
                      .read(grammarDetailController.notifier)
                      .readXlGrammarTest(txtExerciseName.controller.text);

                  showSuccessToastMessage(context, "Амжилттай хадгаллаа");
                } catch (ex) {
                  showErrorToastMessage(context, "Алдаа гарлаа");
                }
              },
            ),
          ]),
          StreamBuilder(
            stream: _database.child('GrammarTest').orderByKey().onValue,
            builder: (context, snapshot) {
              final tilesList = <Widget>[];

              if ((snapshot.data! as Event).snapshot.value != null &&
                  snapshot.hasData) {
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
                                  child: Text(value["name"]),
                                ),
                              ])
                        ],
                      ),
                      onTap: () {
                        var exercise = GrammarExercise.fromRTDB(value);
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

  // Future<void> pickExcel(BuildContext context) async {
  //   FilePickerResult? result = await FilePicker.platform.pickFiles();
  //   print("resultAri");
  //   if (result != null) {
  //     print("result has");

  //     PlatformFile file = result.files.first;
  //     var excel = Excel.decodeBytes(file.bytes!);
  //     await readExcel(excel)
  //         .then((value) => {showSuccessToastMessage(context, "amjilltai")})
  //         .onError((error, stackTrace) =>
  //             {showErrorToastMessage(context, "aldaa garlaa")});
  //   } else {
  //     // User canceled the picker
  //   }
  // }
}
