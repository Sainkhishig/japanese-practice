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

class QuestionAddList extends HookConsumerWidget {
  QuestionAddList({
    Key? key,
    this.title = "",
    required this.onClickAdd,
    required this.lstQuestion,
    this.isRemovable = true,
    this.isCreatable = true,
    this.onItemRemoved,
  }) : super(key: key);
  final List<QuestionItem> lstQuestion;
  final String title;
  final bool isRemovable;
  final bool isCreatable;

  /// 検索機能

  final QuestionItem Function() onClickAdd;
  late Function(QuestionItem removedItem)? onItemRemoved;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AfenRichTextField answerGenerateWidget =
        AfenRichTextField("Хариулт үүсгэх");
    //  CustomDraggableCards(List<ImageItem> lstQuestion) {
    // Returns index of item with given key
    int _indexOfKey(Key key) {
      return lstQuestion.indexWhere((QuestionItem d) => d.key == key);
    }

    return StatefulBuilder(builder: (context, setState) {
      return ListView.builder(
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
                                Row(
                                  children: [
                                    answerGenerateWidget,
                                    IconButton(
                                        onPressed: () {
                                          setState(
                                            () {
                                              var lstAnswers =
                                                  answerGenerateWidget
                                                      .controller.text
                                                      .split("\n");

                                              lstQuestion[index].answerWidget =
                                                  AnswerOptionList(
                                                      onClickAdd: () {
                                                        return AsnwerOptionFieldItem(
                                                            AfenTextField(
                                                                "Хариултууд"),
                                                            AfenCheckbox(false),
                                                            Key("1"));
                                                      },
                                                      lstAnswer: [
                                                    ...lstAnswers.map((e) {
                                                      var answerWidget =
                                                          AfenTextField(
                                                              "Хариулт");
                                                      answerWidget
                                                          .controller.text = e;
                                                      return AsnwerOptionFieldItem(
                                                          answerWidget,
                                                          AfenCheckbox(false),
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
          });
    });
  }

  Widget _buildRowItem(StateSetter setState, QuestionItem rowItem) {
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

class QuestionItem {
  QuestionItem(this.key);
  final AfenTextField questionWidget = AfenTextField(
    "асуулт",
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

  QuestionItem.clone(QuestionItem randomObject) : this(randomObject.key);
}
