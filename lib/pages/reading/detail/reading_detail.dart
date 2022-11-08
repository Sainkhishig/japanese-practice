import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:japanese_practise_n5/common/widget/afen_checkbox.dart';
import 'package:japanese_practise_n5/common/widget/afen_rich_text_field.dart';
import 'package:japanese_practise_n5/common/widget/afen_text_field.dart';
import 'package:japanese_practise_n5/common/widget/answer_option_list%20copy.dart';
import 'package:japanese_practise_n5/common/widget/question_add_list.dart';
import 'package:japanese_practise_n5/common/widget/save_button.dart';

import 'package:japanese_practise_n5/common/widget/widget_add_list.dart';
import 'package:japanese_practise_n5/pages/reading/detail/reading_detail_controller.dart';
import 'package:japanese_practise_n5/pages/reading/model/reading_model.dart';

// pyfm061 : キャンセル規定編集
class ReadingDetail extends HookConsumerWidget {
  ReadingDetail({Key? key, this.selectedExerciseData}) : super(key: key);
  late ReadingExercise? selectedExerciseData;
  List<WidgetGroupItem> listReadingWidget = [];
  AfenTextField txtExerciseName = AfenTextField("Дасгалын дугаар");
  AfenRichTextField txtVocabularies = AfenRichTextField("Шинэ үг");
  late WidgetAddList listReadingExercise;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(readingDetailController.notifier);
    controller.setModelListenable(ref);
    // ReadingExercise? reading;
    if (listReadingWidget.isEmpty) {
      if (selectedExerciseData != null) {
        // reading = ReadingExercise.fromRTDB(selectedExerciseData);
        print("model");
        for (var exercise in selectedExerciseData!.exercises) {
          listReadingWidget.add(getReadingTemplate(exercise));
        }
      } else {
        listReadingWidget.add(getReadingTemplate());
      }
    }

    listReadingExercise = WidgetAddList(
        onClickAdd: () {
          return getReadingTemplate();
        },
        widgetItems: listReadingWidget);

    if (selectedExerciseData != null) {
      txtExerciseName.controller.text = selectedExerciseData!.name;
      txtVocabularies.controller.text =
          selectedExerciseData!.vocabularies.join("/n");
    }

    return Scaffold(
        body: ListView(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          txtExerciseName,
          txtVocabularies,
          listReadingExercise,
          // Expanded(child: listReadingExercise),
          SaveButton(
            onSave: () {
              save(controller);
            },
          )
        ]));
  }

  save(ReadingDetailController controller) {
    var items = listReadingExercise.widgetItems
        .map((e) => e.widget as ReadingDetailItem)
        .toList();

    var vocabularies = txtVocabularies.controller.text.split("\n");
    controller.writeNew(
        txtExerciseName.controller.text.trim(), items, vocabularies);
  }

  WidgetGroupItem getReadingTemplate([Reading? exercise]) {
    AfenTextField txtName = AfenTextField("Дасгал");
    AfenRichTextField txtContent = AfenRichTextField("эх");
    QuestionAddList questionWidgetController;
    List<QuestionItem> lstQuestion = [];
    if (exercise != null) {
      txtName.controller.text = exercise.section;
      txtContent.controller.text = exercise.content;
      lstQuestion = [];

      for (var question in exercise.questions) {
        var answerWidget = QuestionItem(Key("2"));

        answerWidget.question.controller.text = question.question;
        answerWidget.answers = AnswerOptionList(
            onClickAdd: () {
              return AsnwerOptionFieldItem(
                  AfenTextField("Хариулт"), AfenCheckbox(false), Key("1"));
            },
            lstAnswer: [
              ...question.answers.map((e) {
                var answerWidget = AfenTextField("Хариулт");
                answerWidget.controller.text = e.answer;
                return AsnwerOptionFieldItem(
                    answerWidget, AfenCheckbox(e.isTrue), Key("1"));
              })
            ]);
        lstQuestion.add(answerWidget);
      }
    } else {
      lstQuestion = [QuestionItem(const Key("2"))];
    }
    questionWidgetController = QuestionAddList(
        onClickAdd: () {
          return QuestionItem(const Key("1"));
        },
        lstQuestion: lstQuestion);
    return WidgetGroupItem(
        ReadingDetailItem(txtName, txtContent, questionWidgetController),
        const ValueKey("fee.id"));
  }
}

class ReadingDetailItem extends HookConsumerWidget {
  ReadingDetailItem(
    this.txtName,
    this.txtContent,
    this.lstQuestionWidgets, {
    Key? key,
  }) : super(key: key);
  final AfenTextField txtName;
  final AfenRichTextField txtContent;

  final QuestionAddList lstQuestionWidgets;

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
            SizedBox(
              height: 600,
              width: 500,
              child: lstQuestionWidgets,
            )
          ],
        ));
  }
}
