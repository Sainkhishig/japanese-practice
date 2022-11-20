import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:japanese_practise_n5/common/widget/afen_checkbox.dart';
import 'package:japanese_practise_n5/common/widget/afen_rich_text_field.dart';
import 'package:japanese_practise_n5/common/widget/afen_text_field.dart';
import 'package:japanese_practise_n5/common/widget/answer_option_list.dart';
import 'package:japanese_practise_n5/common/widget/question_add_list.dart';
import 'package:japanese_practise_n5/common/widget/save_button.dart';
import 'package:japanese_practise_n5/common/widget/text_add_list.dart';
import 'package:japanese_practise_n5/common/widget/widget_add_list.dart';
import 'package:japanese_practise_n5/pages/grammar/detail/grammar_detail_controller.dart';
import 'package:japanese_practise_n5/pages/grammar/model/grammar_model.dart';

// pyfm061 : キャンセル規定編集
class GrammarDetail extends HookConsumerWidget {
  GrammarDetail({Key? key, this.selectedExerciseData}) : super(key: key);
  late GrammarExercise? selectedExerciseData;
  List<WidgetGroupItem> listReadingWidget = [];
  AfenTextField txtExerciseName = AfenTextField("Дасгалын дугаар");
  AfenRichTextField txtVocabularies = AfenRichTextField("Шинэ үг");
  late QuestionAddList listGrammarExercise;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(grammarDetailController.notifier);
    controller.setModelListenable(ref);
    List<QuestionItem> lstQuestion = [];
    if (selectedExerciseData != null) {
      print("gam${selectedExerciseData!.name}");
      lstQuestion = [];

      for (var question in selectedExerciseData!.exercises) {
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
      print("gam{selectedExerciseData!.name}");
      lstQuestion = [QuestionItem(const Key("2"))];
    }
    listGrammarExercise = QuestionAddList(
        onClickAdd: () {
          return QuestionItem(const Key("1"));
        },
        lstQuestion: lstQuestion);

    if (selectedExerciseData != null) {
      txtExerciseName.controller.text = selectedExerciseData!.name;
      txtVocabularies.controller.text =
          selectedExerciseData!.vocabularies.join("/n");
    }

    return Scaffold(
        body: ListView(children: [
      txtExerciseName,
      txtVocabularies,
      SizedBox(height: 600, width: 500, child: listGrammarExercise),
      SaveButton(
        onSave: () {
          save(controller);
        },
      )
    ]));
  }

  save(GrammarDetailController controller) {
    var vocabularies = txtVocabularies.controller.text.split("\n");
    controller.writeNew(
        selectedExerciseData == null ? "" : selectedExerciseData!.key,
        txtExerciseName.controller.text.trim(),
        listGrammarExercise.lstQuestion,
        vocabularies);
  }
}

class GrammarDetailItem extends HookConsumerWidget {
  GrammarDetailItem(
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
            "Ханз",
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
