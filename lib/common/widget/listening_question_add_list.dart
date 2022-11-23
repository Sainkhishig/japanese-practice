import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_reorderable_list/flutter_reorderable_list.dart' as lib;
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:japanese_practise_n5/common/widget/afen_checkbox.dart';
import 'package:japanese_practise_n5/common/widget/afen_rich_text_field.dart';
import 'package:japanese_practise_n5/common/widget/afen_text_field.dart';
import 'package:japanese_practise_n5/common/widget/answer_option_list.dart';

enum DraggingMode {
  iOS,
  android,
}

class ListeningQuestionAddList extends HookConsumerWidget {
  ListeningQuestionAddList({
    Key? key,
    this.title = "",
    required this.onClickAdd,
    required this.lstQuestion,
    this.isRemovable = true,
    this.isCreatable = true,
    this.onItemRemoved,
  }) : super(key: key);
  final List<ListeningQuestionItem> lstQuestion;
  final String title;
  final bool isRemovable;
  final bool isCreatable;
  List<FileSource> lstAudioSource = [];
  List<FileSource> lstImageSource = [];
  List<int> lstTrueAnswers = [];

  /// 検索機能

  final ListeningQuestionItem Function() onClickAdd;
  late Function(ListeningQuestionItem removedItem)? onItemRemoved;
  AfenTextField sourceGenerateWidget = AfenTextField("файл бэлдэх");
  AfenRichTextField anserFillWidget = AfenRichTextField("Хариулт бөглөх");
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StatefulBuilder(builder: (context, setState) {
      return ListTile(
          title: SizedBox(
              height: 130,
              child: ListView(children: [
                Row(
                  children: [
                    sourceGenerateWidget,
                    IconButton(
                        onPressed: () async {
                          var sourcePath =
                              sourceGenerateWidget.controller.text.trim();
                          final storageRef =
                              FirebaseStorage.instance.ref().child(sourcePath);
                          final listResult = await storageRef.listAll();
                          setState(
                            () {
                              lstImageSource = [];
                              lstAudioSource = [];
                              print("listResult:${listResult.items.length}");
                              for (var source in listResult.items) {
                                print("prefix::${source.fullPath}");
                                print("prefix::${source.name}");
                                lstAudioSource.add(
                                    FileSource(source.name, source.fullPath));
                                // The items under storageRef.
                              }
                              for (var source in listResult.items) {
                                print("prefix::${source.fullPath}");
                                print("prefix::${source.name}");
                                lstImageSource.add(
                                    FileSource(source.name, source.fullPath));
                              }
                            },
                          );
                        },
                        icon: Icon(Icons.file_download))
                  ],
                ),
                SizedBox(
                  height: 63,
                  child: Row(
                    children: [
                      anserFillWidget,
                      IconButton(
                          onPressed: () async {
                            var trueAnswers =
                                anserFillWidget.controller.text.trim();
                            setState(
                              () {
                                var truesAnswerLines =
                                    trueAnswers.split("\n").toList();
                                lstTrueAnswers = truesAnswerLines
                                    .map((e) => int.parse(e.split(':')[1]))
                                    .toList();
                                print("answers:$lstTrueAnswers");

                                // for (var source in listResult.items) {
                                //   print("prefix::${source.fullPath}");
                                //   print("prefix::${source.name}");
                                //   lstImageSource.add(
                                //       FileSource(source.name, source.fullPath));
                                // }
                              },
                            );
                          },
                          icon: Icon(Icons.checklist_rtl_sharp))
                    ],
                  ),
                ),
              ])),
          subtitle: ListView.builder(
              itemCount: lstQuestion.length,
              // shrinkWrap: true,
              // physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      // borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: Colors.black,
                        width: 1,
                      ),
                    ),
                    child: ListTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Visibility(
                            visible: lstQuestion.length != 1 && isRemovable,
                            child: IconButton(
                              icon: const Icon(
                                Icons.indeterminate_check_box,
                                color: Colors.green,
                                size: 30,
                              ),
                              tooltip: 'remove action',
                              onPressed: () {
                                setState(
                                  () {
                                    lstQuestion.remove(lstQuestion[index]);
                                    // onItemRemoved!.call(rowItem);
                                  },
                                );
                              },
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                            height: 50,
                          ),
                          Visibility(
                            visible: isCreatable,
                            child: IconButton(
                              icon: const Icon(
                                Icons.add_box,
                                color: Colors.green,
                                size: 30,
                              ),
                              tooltip: 'add action',
                              onPressed: () {
                                var newItem = onClickAdd.call();

                                setState(
                                  () {
                                    lstQuestion.add(newItem);
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      subtitle: Row(children: [
                        Expanded(
                            flex: 5,
                            child: ListTile(
                                contentPadding: const EdgeInsets.all(0),
                                title: const Padding(
                                  padding: EdgeInsets.only(bottom: 8.0),
                                  child: Text(
                                    "Асуулт",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    lstQuestion[index].questionWidget,
                                    Container(
                                      width: 250,
                                      padding: const EdgeInsets.all(20),
                                      child: DropdownButtonHideUnderline(
                                          child: DropdownButtonFormField(
                                        dropdownColor: Colors.white,
                                        hint: Text(
                                            "${lstQuestion[index].audioUrl}"),
                                        isDense: true,
                                        items: getDropItems(lstAudioSource),
                                        value: lstQuestion[index].audioUrl,
                                        onChanged: (value) {
                                          var selectedLevel = "$value";
                                          lstQuestion[index].audioUrl =
                                              selectedLevel;
                                        },
                                      )),
                                    ),
                                    Container(
                                      width: 250,
                                      padding: const EdgeInsets.all(20),
                                      child: DropdownButtonHideUnderline(
                                          child: DropdownButtonFormField(
                                        dropdownColor: Colors.white,
                                        hint: Text(
                                            "${lstQuestion[index].imageUrl}"),
                                        isDense: true,
                                        items: getDropItems(lstImageSource),
                                        value: lstQuestion[index].imageUrl,
                                        onChanged: (value) {
                                          var selectedLevel = "$value";
                                          lstQuestion[index].imageUrl =
                                              selectedLevel;
                                        },
                                      )),
                                    ),
                                    Row(
                                      children: [
                                        lstQuestion[index].answerGenerateWidget,
                                        IconButton(
                                            onPressed: () {
                                              setState(
                                                () {
                                                  var lstAnswers =
                                                      lstQuestion[index]
                                                          .answerGenerateWidget
                                                          .controller
                                                          .text
                                                          .split("\n");
                                                  var trueAnswerIndex =
                                                      lstTrueAnswers[index] - 1;
                                                  print(
                                                      "trueAnswerIndex:$trueAnswerIndex");
                                                  lstQuestion[index]
                                                          .answerWidget =
                                                      AnswerOptionList(
                                                          onClickAdd: () {
                                                            return AsnwerOptionFieldItem(
                                                                AfenTextField(
                                                                    "Хариултууд"),
                                                                AfenCheckbox(
                                                                    false),
                                                                Key("1"));
                                                          },
                                                          lstAnswer: [
                                                        ...lstAnswers
                                                            .asMap()
                                                            .entries
                                                            .map((answer) {
                                                          int index =
                                                              answer.key;
                                                          dynamic answerVal =
                                                              answer.value;

                                                          var answerWidget =
                                                              AfenTextField(
                                                                  "Хариулт");
                                                          answerWidget
                                                              .controller
                                                              .text = answerVal;
                                                          return AsnwerOptionFieldItem(
                                                              answerWidget,
                                                              AfenCheckbox(
                                                                  trueAnswerIndex ==
                                                                      index),
                                                              Key("1"));
                                                        })
                                                      ]);
                                                  [];
                                                },
                                              );
                                            },
                                            icon: Icon(Icons.create_outlined))
                                      ],
                                    ),
                                    SizedBox(
                                      height: 300,
                                      width: 500,
                                      child: lstQuestion[index].answerWidget,
                                    )
                                  ],
                                ))),
                      ]),
                    )
                    // Row(children: [
                    //   Visibility(
                    //     visible: title.isNotEmpty,
                    //     child: Text(title),
                    //   ),
                    //   Expanded(
                    //       flex: 5,
                    //       child: _buildRowItem(
                    //         setState,
                    //         lstQuestion[index],
                    //       )),
                    // ]),
                    );
              }));
    });
  }

  List<DropdownMenuItem<String>> getDropItems(List<FileSource> urlPaths) {
    List<DropdownMenuItem<String>> lstDropItem = urlPaths.map((source) {
      return DropdownMenuItem<String>(
          alignment: AlignmentDirectional.center,
          value: source.fileUrl,
          child: Text(
            source.fileName,
            textAlign: TextAlign.center,
          ));
    }).toList();

    // for (var i = 1; i <= 5; i++) {
    //   lstDropItem.add(DropdownMenuItem<String>(
    //       alignment: AlignmentDirectional.center,
    //       value: "$i",
    //       child: Text(
    //         "N$i түвшин",
    //         textAlign: TextAlign.center,
    //       )));
    // }
    return lstDropItem;
  }

  Widget _buildRowItem(StateSetter setState, ListeningQuestionItem rowItem) {
    Widget content = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Visibility(
              visible: lstQuestion.length != 1 && isRemovable,
              child: IconButton(
                icon: const Icon(
                  Icons.indeterminate_check_box,
                  color: Colors.green,
                  size: 30,
                ),
                tooltip: 'remove action',
                onPressed: () {
                  setState(
                    () {
                      lstQuestion.remove(rowItem);
                      // onItemRemoved!.call(rowItem);
                    },
                  );
                },
              ),
            ),
            const SizedBox(
              width: 10,
              height: 50,
            ),
            Visibility(
              visible: isCreatable,
              child: IconButton(
                icon: const Icon(
                  Icons.add_box,
                  color: Colors.green,
                  size: 30,
                ),
                tooltip: 'add action',
                onPressed: () {
                  var newItem = onClickAdd.call();

                  setState(
                    () {
                      lstQuestion.add(newItem);
                    },
                  );
                },
              ),
            ),
          ],
        ),
        rowItem.questionWidget,
        SizedBox(
          height: 330,
          width: 500,
          child: rowItem.answerWidget,
        )
      ],
    );

    return content;
  }
}

class ListeningQuestionItem {
  ListeningQuestionItem(this.key, this.audioUrl, this.imageUrl);
  String? audioUrl;
  String? imageUrl;
  AfenRichTextField answerGenerateWidget = AfenRichTextField("Хариулт үүсгэх");
  final AfenTextField questionWidget = AfenTextField(
    "сонсгол",
  );

  AnswerOptionList answerWidget = AnswerOptionList(
      onClickAdd: () {
        return AsnwerOptionFieldItem(
            AfenTextField("Хариултууд"), AfenCheckbox(false), Key("1"));
      },
      lstAnswer: [
        AsnwerOptionFieldItem(
            AfenTextField("Хариултууд"), AfenCheckbox(false), Key("2"))
      ]);
  final Key key;

  ListeningQuestionItem.clone(ListeningQuestionItem randomObject)
      : this(randomObject.key, randomObject.audioUrl, randomObject.imageUrl);
}

class FileSource {
  late String fileName;
  late String fileUrl;
  FileSource(this.fileName, this.fileUrl);
}
