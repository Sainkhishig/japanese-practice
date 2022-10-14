import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:japanese_practise_n5/common/widget/afen_rich_text_field.dart';
import 'package:japanese_practise_n5/common/widget/afen_text_field.dart';
import 'package:japanese_practise_n5/common/widget/save_button.dart';
import 'package:japanese_practise_n5/common/widget/text_add_list.dart';
import 'package:japanese_practise_n5/common/widget/widget_add_list.dart';
import 'package:japanese_practise_n5/pages/kanji/detail/kanji_detail_controller.dart';

// pyfm061 : キャンセル規定編集
class KanjiDetail extends HookConsumerWidget {
  KanjiDetail({Key? key}) : super(key: key);
  List<WidgetGroupItem> listKanjiWidget = [];
  AfenTextField txtExerciseName = AfenTextField("Дасгалын дугаар");
  late WidgetAddList listKanjiExercise;

  TextAddList vocabularyController = TextAddList(
      onClickAdd: () {
        return AsnwerFieldItem(AfenTextField("Шинэ үг"), Key("1"));
      },
      lstAnswer: [AsnwerFieldItem(AfenTextField("Шинэ үг"), Key("2"))]);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(kanjiDetailController.notifier);
    controller.setModelListenable(ref);
    if (listKanjiWidget.isEmpty) {
      listKanjiWidget.add(getKanjiTemplate());
    }

    listKanjiExercise = WidgetAddList(
        onClickAdd: () {
          return getKanjiTemplate();
        },
        widgetItems: listKanjiWidget);

    return Scaffold(
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            txtExerciseName,
            listKanjiExercise,
            vocabularyController,
            SaveButton(
              onSave: () {
                save(controller);
              },
            )
          ])),
    );
  }

  save(KanjiDetailController controller) {
    var items = listKanjiExercise.widgetItems
        .map((e) => e.widget as KanjiDetailItem)
        .toList();

    var vocabularies = vocabularyController.lstAnswer
        .map((e) => e.field.controller.text)
        .toList();
    controller.writeNew(
        txtExerciseName.controller.text.trim(), items, vocabularies);
  }

  WidgetGroupItem getKanjiTemplate() {
    AfenTextField txtName = AfenTextField("Дасгал");
    AfenRichTextField txtContent = AfenRichTextField("эх");
    AfenTextField txtQuestion = AfenTextField("асуулт");
    AfenTextField txtAnswer = AfenTextField("хариу");
    TextAddList answerController = TextAddList(
        onClickAdd: () {
          return AsnwerFieldItem(AfenTextField("Хариулт"), Key("1"));
        },
        lstAnswer: [AsnwerFieldItem(AfenTextField("Хариулт"), Key("2"))]);

    return WidgetGroupItem(
        KanjiDetailItem(
          txtName,
          txtContent,
          txtQuestion,
          txtAnswer,
          answerController,
        ),
        ValueKey("fee.id"));
  }
}

class KanjiDetailItem extends HookConsumerWidget {
  KanjiDetailItem(
    this.txtName,
    this.txtContent,
    this.txtQuestion,
    this.txtAnswer,
    this.lstAnswerChoiceWidget, {
    Key? key,
  }) : super(key: key);
  final AfenTextField txtName;
  final AfenRichTextField txtContent;
  final AfenTextField txtQuestion;
  final AfenTextField txtAnswer;
  final TextAddList lstAnswerChoiceWidget;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
        contentPadding: const EdgeInsets.all(0),
        title: const Padding(
          padding: EdgeInsets.only(bottom: 8.0),
          child: Text(
            "Уншлага",
            style: TextStyle(fontSize: 12),
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            txtName,
            txtContent,
            txtQuestion,
            txtAnswer,
            SizedBox(
              height: 330,
              width: 500,
              child: lstAnswerChoiceWidget,
            )
          ],
        ));
  }
}
