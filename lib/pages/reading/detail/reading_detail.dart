import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:japanese_practise_n5/common/widget/afen_rich_text_field.dart';
import 'package:japanese_practise_n5/common/widget/afen_text_field.dart';
import 'package:japanese_practise_n5/common/widget/save_button.dart';
import 'package:japanese_practise_n5/common/widget/text_add_list.dart';
import 'package:japanese_practise_n5/common/widget/widget_add_list.dart';
import 'package:japanese_practise_n5/pages/reading/detail/reading_detail_controller.dart';

// pyfm061 : キャンセル規定編集
class ReadingDetail extends HookConsumerWidget {
  ReadingDetail({Key? key, this.selectedExerciseData}) : super(key: key);
  late dynamic selectedExerciseData;
  List<WidgetGroupItem> listReadingWidget = [];
  AfenTextField txtExerciseName = AfenTextField("Дасгалын дугаар");
  late WidgetAddList listReadingExercise;

  TextAddList vocabularyController = TextAddList(
      onClickAdd: () {
        return AsnwerFieldItem(AfenTextField("Шинэ үг"), Key("1"));
      },
      lstAnswer: [AsnwerFieldItem(AfenTextField("Шинэ үг"), Key("2"))]);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(readingDetailController.notifier);
    controller.setModelListenable(ref);
    if (listReadingWidget.isEmpty) {
      if (selectedExerciseData != null) {
        var lstExercises = selectedExerciseData["exercises"] as List;
        for (var exercise in lstExercises) {
          listReadingWidget.add(getReadingTemplate(exercise));
        }
      } else
        listReadingWidget.add(getReadingTemplate());
    }

    listReadingExercise = WidgetAddList(
        onClickAdd: () {
          return getReadingTemplate();
        },
        widgetItems: listReadingWidget);

    if (selectedExerciseData != null) {
      txtExerciseName.controller.text = selectedExerciseData["name"];
    }
    return Scaffold(
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            txtExerciseName,
            listReadingExercise,
            vocabularyController,
            SaveButton(
              onSave: () {
                save(controller);
              },
            )
          ])),
    );
  }

  save(ReadingDetailController controller) {
    var items = listReadingExercise.widgetItems
        .map((e) => e.widget as ReadingDetailItem)
        .toList();

    var vocabularies = vocabularyController.lstAnswer
        .map((e) => e.field.controller.text)
        .toList();
    controller.writeNew(
        txtExerciseName.controller.text.trim(), items, vocabularies);
  }

  WidgetGroupItem getReadingTemplate([exercise]) {
    AfenTextField txtName = AfenTextField("Дасгал");
    AfenRichTextField txtContent = AfenRichTextField("эх");
    AfenTextField txtQuestion = AfenTextField("асуулт");
    AfenTextField txtAnswer = AfenTextField("хариу");
    TextAddList answerController = TextAddList(
        onClickAdd: () {
          return AsnwerFieldItem(AfenTextField("Хариулт"), Key("1"));
        },
        lstAnswer: [AsnwerFieldItem(AfenTextField("Хариулт"), Key("2"))]);

    if (exercise != null) {
      txtContent.controller.text = exercise["content"];
      txtQuestion.controller.text = exercise["question"];
      txtAnswer.controller.text = exercise["answer"];
      var lstAnswerNew = [];
      for (var answer in exercise["answers"]) {
        var answerWidget = AsnwerFieldItem(AfenTextField("Хариулт"), Key("2"));
        answerWidget.field.controller.text = answer["name"];
        lstAnswerNew.add(answerWidget);
      }
      // txtAnswer.controller.text = exercise["answer"];
      answerController = TextAddList(
          onClickAdd: () {
            return AsnwerFieldItem(AfenTextField("Хариулт"), Key("1"));
          },
          lstAnswer: [...lstAnswerNew]);
    } else {
      answerController = TextAddList(
          onClickAdd: () {
            return AsnwerFieldItem(AfenTextField("Хариулт"), Key("1"));
          },
          lstAnswer: [AsnwerFieldItem(AfenTextField("Хариулт"), Key("2"))]);
    }
    return WidgetGroupItem(
        ReadingDetailItem(
          txtName,
          txtContent,
          txtQuestion,
          txtAnswer,
          answerController,
        ),
        ValueKey("fee.id"));
  }
}

class ReadingDetailItem extends HookConsumerWidget {
  ReadingDetailItem(
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
