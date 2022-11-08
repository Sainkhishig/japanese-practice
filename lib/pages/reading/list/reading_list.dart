import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:japanese_practise_n5/pages/reading/list/reading_list_controller.dart';
import 'package:japanese_practise_n5/pages/reading/model/reading_model.dart';

// pyfm060 : キャンセル規定一覧 ReadingList
class ReadingList extends HookConsumerWidget {
  ReadingList({Key? key}) : super(key: key);
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
      // body: Scaffold(
      //   body: lsttableServings.isEmpty
      //       ? showEmptyDataWidget()
      //       : //Expanded(child: FlashCardListItem(flashcards: flashCard)),

      //       PageView(
      //           controller: pageController,
      //           children: lsttableServings,
      //           onPageChanged: (value) {
      //             controller.setSelectedIndex(value);
      //           },
      //         ),
      // ),
      body:
          //Expanded(child: FlashCardListItem(flashcards: flashCard)),
          Column(
        children: [
          Text("this is list"),
          StreamBuilder(
            stream: _database.child('ReadingExercises').orderByKey().onValue,
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
                  ReadingHeader hdr = ReadingHeader();

                  hdr.exerciseName = value["name"];
                  // hdr.vocabularies = value["vocabularies"];
                  // hdr.passages = value["exercises"];
                  // final nextUser =
                  //     CategoryModel.fromRTDB(Map<String, dynamic>.from(value));
                  // print("gram*${nextUser.code}");
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
                                  child: Text(hdr.exerciseName),
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

  Widget tabCardBody(ReadingHeader nextUser) {
    return Card(
        child: Column(
      children: [
        // Text(
        //   currentLetter.name,
        //   style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        // ),
        Container(
          decoration: const BoxDecoration(
              border:
                  Border(bottom: BorderSide(width: 1.0, color: Colors.grey))),
          child: ListTile(
            leading: const Icon(Icons.verified_user),
            title: Text(nextUser.exerciseName),
            subtitle: Column(children: const [
              // Text(nextUser.answer),
              // Text(nextUser.writeDate.toString())
            ]),
            onTap: () {
              // controller.update(keyUser);
            },
          ),
        )
      ],
    ));
  }
}

class ReadingHeader {
  late String exerciseName;
  late List<String> vocabularies;
  late List passages;
}
