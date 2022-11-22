import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:japanese_practise_n5/common/widget/afen_checkbox.dart';
import 'package:japanese_practise_n5/common/widget/afen_rich_text_field.dart';
import 'package:japanese_practise_n5/common/widget/afen_text_field.dart';
import 'package:japanese_practise_n5/common/widget/answer_option_list.dart';
import 'package:japanese_practise_n5/common/widget/listening_question_add_list.dart';
import 'package:japanese_practise_n5/common/widget/save_button.dart';
import 'package:japanese_practise_n5/common/widget/widget_add_list.dart';
import 'package:japanese_practise_n5/pages/listening/detail/listening_detail_controller.dart';
import 'package:japanese_practise_n5/pages/listening/model/listening_model.dart';

// pyfm061 : キャンセル規定編集
class ListeningDetail extends HookConsumerWidget {
  ListeningDetail({Key? key, this.selectedExerciseData}) : super(key: key);
  late ListeningExercise? selectedExerciseData;
  List<WidgetGroupItem> listReadingWidget = [];
  AfenTextField txtExerciseName = AfenTextField("Дасгалын дугаар");
  AfenRichTextField txtVocabularies = AfenRichTextField("Шинэ үг");
  late ListeningQuestionAddList listListeningExercise;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(listeningDetailController.notifier);
    controller.setModelListenable(ref);
    List<ListeningQuestionItem> lstQuestion = [];
    if (selectedExerciseData != null) {
      print("gams${selectedExerciseData!.name}");
      lstQuestion = [];

      for (var question in selectedExerciseData!.exercises) {
        var questItem = ListeningQuestionItem(Key("2"));
        // answerWidget.audioUrl = selectedExerciseData
        questItem.questionWidget.controller.text = question.question;
        questItem.audioUrl == question.audioUrl;
        questItem.imageUrl == question.imageUrl;
        questItem.answerWidget.lstAnswer = [
          ...question.answers.map((e) {
            var answerWidget = AfenTextField("Хариулт");
            answerWidget.controller.text = e.answer;
            return AsnwerOptionFieldItem(
                answerWidget, AfenCheckbox(e.isTrue), Key("1"));
          })
        ];
        lstQuestion.add(questItem);
      }
    } else {
      print("gam{selectedExerciseData!.name}");
      lstQuestion = [ListeningQuestionItem(const Key("2"))];
    }
    listListeningExercise = ListeningQuestionAddList(
        onClickAdd: () {
          return ListeningQuestionItem(const Key("1"));
        },
        lstQuestion: lstQuestion);

    if (selectedExerciseData != null) {
      listListeningExercise.sourceGenerateWidget.controller.text =
          selectedExerciseData!.storagePath;
      txtExerciseName.controller.text = selectedExerciseData!.name;
      txtVocabularies.controller.text =
          selectedExerciseData!.vocabularies.join("/n");
    }

    return Scaffold(
        body: ListView(children: [
      txtExerciseName,
      txtVocabularies,
      SizedBox(height: 600, width: 500, child: listListeningExercise),
      SaveButton(
        onSave: () {
          save(controller);
        },
      )
    ]));
  }

  save(ListeningDetailController controller) {
    var vocabularies = txtVocabularies.controller.text.split("\n");
    String storagePath =
        listListeningExercise.sourceGenerateWidget.controller.text.trim();
    controller.writeNew(
        selectedExerciseData == null ? "" : selectedExerciseData!.key,
        txtExerciseName.controller.text.trim(),
        listListeningExercise.lstQuestion,
        vocabularies,
        storagePath);
  }
}
