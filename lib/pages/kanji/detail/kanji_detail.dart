import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:japanese_practise_n5/classes/import_model.dart';
import 'package:japanese_practise_n5/common/common_widget.dart';
import 'package:japanese_practise_n5/common/widget/afen_checkbox.dart';
import 'package:japanese_practise_n5/common/widget/afen_rich_text_field.dart';
import 'package:japanese_practise_n5/common/widget/afen_text_field.dart';
import 'package:japanese_practise_n5/common/widget/answer_option_list.dart';
import 'package:japanese_practise_n5/common/widget/question_add_list.dart';
import 'package:japanese_practise_n5/common/widget/save_button.dart';
import 'package:japanese_practise_n5/common/widget/text_add_list.dart';
import 'package:japanese_practise_n5/common/widget/widget_add_list.dart';
import 'package:japanese_practise_n5/pages/kanji/detail/kanji_detail_controller.dart';
import 'package:japanese_practise_n5/pages/kanji/model/kanji_model.dart';

// pyfm061 : キャンセル規定編集
class KanjiDetail extends HookConsumerWidget {
  KanjiDetail({Key? key, this.selectedExerciseData}) : super(key: key);
  late KanjiExercise? selectedExerciseData;
  List<WidgetGroupItem> listReadingWidget = [];
  AfenTextField txtExerciseName = AfenTextField("Дасгалын дугаар");
  AfenRichTextField txtVocabularies = AfenRichTextField("Шинэ үг");
  AfenRichTextField txtReference = AfenRichTextField("Тодруулга");
  late QuestionAddList listKanjiExercise;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(kanjiDetailController.notifier);
    controller.setModelListenable(ref);
    List<QuestionItem> lstQuestion = [];
    if (selectedExerciseData != null) {
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
      lstQuestion = [QuestionItem(const Key("2"))];
    }
    listKanjiExercise = QuestionAddList(
        onClickAdd: () {
          return QuestionItem(const Key("1"));
        },
        lstQuestion: lstQuestion);

    if (selectedExerciseData != null) {
      txtExerciseName.controller.text = selectedExerciseData!.name;
      txtVocabularies.controller.text =
          selectedExerciseData!.vocabularies.join("\n");
      txtReference.controller.text = selectedExerciseData!.reference;
    }

    return Scaffold(
        body: ListView(children: [
      txtExerciseName,
      txtReference,
      txtVocabularies,
      SizedBox(height: 600, width: 500, child: listKanjiExercise),
      SaveButton(
        onSave: () async {
          try {
            await save(controller);
            showSuccessToastMessage(context, "Амжилттай хадгаллаа");
          } catch (ex) {
            showErrorToastMessage(context, "Алдаа гарлаа");
          }
        },
      )
    ]));
  }

  save(KanjiDetailController controller) {
    var vocabularies = txtVocabularies.controller.text.split("\n");

    if (selectedExerciseData != null) {
      selectedExerciseData!.key = selectedExerciseData!.key;
    } else {
      selectedExerciseData = KanjiExercise.empty();
      selectedExerciseData!.key = "";
    }
    selectedExerciseData!.name = txtExerciseName.controller.text.trim();
    selectedExerciseData!.reference = txtReference.controller.text.trim();
    selectedExerciseData!.vocabularies = vocabularies;

    controller.writeNew(selectedExerciseData, listKanjiExercise.lstQuestion);
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
