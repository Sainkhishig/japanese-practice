import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:japanese_practise_n5/common/widget/afen_checkbox.dart';
import 'package:japanese_practise_n5/common/widget/afen_rich_text_field.dart';
import 'package:japanese_practise_n5/common/widget/afen_text_field.dart';
import 'package:japanese_practise_n5/common/widget/answer_option_list.dart';
import 'package:japanese_practise_n5/common/widget/question_add_list.dart';
import 'package:japanese_practise_n5/common/widget/save_button.dart';

import 'package:japanese_practise_n5/common/widget/widget_add_list.dart';
import 'package:japanese_practise_n5/pages/listening/detail/listening_detail_controller.dart';
import 'package:japanese_practise_n5/pages/listening/model/listening_model.dart';

// pyfm061 : キャンセル規定編集
class ListeningDetail extends HookConsumerWidget {
  ListeningDetail({Key? key, this.selectedExerciseData}) : super(key: key);
  late ListeningExercise? selectedExerciseData;
  List<WidgetGroupItem> listListeningWidget = [];
  AfenTextField txtExerciseName = AfenTextField("Дасгалын дугаар");
  AfenRichTextField txtVocabularies = AfenRichTextField("Шинэ үг");
  late WidgetAddList listListeningExercise;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(listeningDetailController.notifier);
    controller.setModelListenable(ref);
    // ListeningExercise? listening;
    if (listListeningWidget.isEmpty) {
      if (selectedExerciseData != null) {
        // listening = ListeningExercise.fromRTDB(selectedExerciseData);
        print("model");
        for (var exercise in selectedExerciseData!.exercises) {
          listListeningWidget.add(getListeningTemplate(exercise));
        }
      } else {
        listListeningWidget.add(getListeningTemplate());
      }
    }

    listListeningExercise = WidgetAddList(
        onClickAdd: () {
          return getListeningTemplate();
        },
        widgetItems: listListeningWidget);

    if (selectedExerciseData != null) {
      txtExerciseName.controller.text = selectedExerciseData!.name;
      txtVocabularies.controller.text =
          selectedExerciseData!.vocabularies.join("\n");
    }

    return Scaffold(
        body: ListView(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          txtExerciseName,
          txtVocabularies,
          listListeningExercise,
          // Expanded(child: listListeningExercise),
          SaveButton(
            onSave: () {
              save(controller);
            },
          )
        ]));
  }

  save(ListeningDetailController controller) {
    var items = listListeningExercise.widgetItems
        .map((e) => e.widget as ListeningDetailItem)
        .toList();

    var vocabularies = txtVocabularies.controller.text.split("\n");
    controller.writeNew(
        selectedExerciseData == null ? "" : selectedExerciseData!.key,
        txtExerciseName.controller.text.trim(),
        items,
        vocabularies);
  }

  WidgetGroupItem getListeningTemplate([ListeningSection? exercise]) {
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

        answerWidget.questionWidget.controller.text = question.question;
        answerWidget.answerWidget.lstAnswer = [
          ...question.answers.map((e) {
            var answerWidget = AfenTextField("Хариулт");
            answerWidget.controller.text = e.answer;
            return AsnwerOptionFieldItem(
                answerWidget, AfenCheckbox(e.isTrue), Key("1"));
          })
        ];
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
        ListeningDetailItem(txtName, txtContent, questionWidgetController),
        const ValueKey("fee.id"));
  }
}

class ListeningDetailItem extends HookConsumerWidget {
  ListeningDetailItem(
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
