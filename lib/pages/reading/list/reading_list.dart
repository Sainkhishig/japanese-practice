import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:japanese_practise_n5/common/common_widget.dart';
import 'package:japanese_practise_n5/common/widget/afen_text_field.dart';
import 'package:japanese_practise_n5/common/widget/register_button.dart';
import 'package:japanese_practise_n5/pages/reading/list/reading_list_controller.dart';
import 'package:japanese_practise_n5/pages/reading/model/reading_model.dart';

// pyfm060 : キャンセル規定一覧 ReadingList
class ReadingList extends HookConsumerWidget {
  ReadingList({Key? key}) : super(key: key);
  AfenTextField txtExerciseName = AfenTextField("Эксел нэр");
  final _database = FirebaseDatabase.instance.reference();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    PageController pageController = PageController(
      initialPage: 0,
      keepPage: true,
    );
    final controller = ref.watch(readingListController.notifier);
    // controller.setModelListenable(ref);
    // List<Widget> lsttableServings = [];
    // for (var element in lstLetters) {
    //   lsttableServings.add(tabCardBody(element, context, controller));
    // }
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
                ref.read(readingListController.notifier).clearData();
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
            Expanded(child: txtExerciseName),
            RegisterButton(
              onClick: () async {
                try {
                  // await ref
                  //     .read(vocabularyDetailController.notifier)
                  //     .readXlVocabularyTest(txtExerciseName.controller.text);
                  showSuccessToastMessage(context, "Амжилттай хадгаллаа");
                } catch (ex) {
                  showErrorToastMessage(context, "Алдаа гарлаа");
                }
              },
            ),
          ]),
          StreamBuilder(
            stream: _database.child('ReadingTest').orderByKey().onValue,
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
                                  child: Text(value["name"]),
                                ),
                              ])
                        ],
                      ),
                      onTap: () {
                        var exercise = ReadingExercise.fromRTDB(value);
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
}
