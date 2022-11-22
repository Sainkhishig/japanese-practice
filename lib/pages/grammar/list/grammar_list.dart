import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:japanese_practise_n5/common/widget/register_button.dart';
import 'package:japanese_practise_n5/pages/grammar/list/grammar_list_controller.dart';
import 'package:japanese_practise_n5/pages/grammar/model/grammar_model.dart';

// pyfm060 : キャンセル規定一覧 GrammarList
class GrammarList extends HookConsumerWidget {
  GrammarList({Key? key}) : super(key: key);
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
}
