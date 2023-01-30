import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:japanese_practise_n5/common/common_widget.dart';
import 'package:japanese_practise_n5/common/widget/afen_rich_text_field.dart';
import 'package:japanese_practise_n5/common/widget/afen_text_field.dart';
import 'package:japanese_practise_n5/common/widget/save_button.dart';
import 'package:japanese_practise_n5/pages/excel_import/jlpt_word/entry/jlpt_word_entry_controller.dart';
import 'package:japanese_practise_n5/pages/excel_import/model/JlptWord.dart';

// pyfm061 : キャンセル規定編集
class JlptWordEntry extends HookConsumerWidget {
  JlptWordEntry({Key? key, this.selectedBlog}) : super(key: key);
  late JlptWord? selectedBlog;
  //kanji;kana;pos;meaningMn;meaningEn;example;exampleMn;exampleEn;
  AfenTextField txtkanji = AfenTextField("Ханз");
  AfenTextField txtkana = AfenTextField("kana");
  AfenTextField txtpos = AfenTextField("Бүлэг");
  AfenTextField txtmeaningMn = AfenTextField("Монгол утга");
  AfenTextField txtmeaningEn = AfenTextField("Англи утга");

  AfenRichTextField txtexample = AfenRichTextField("Жишээ");
  AfenRichTextField txtexampleMn = AfenRichTextField("Жишээ монгол");
  AfenRichTextField txtexampleEn = AfenRichTextField("Жишээ англи");
  // late ListeningQuestionAddList listListeningExercise;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(jlptEntryController.notifier);
    controller.setModelListenable(ref);

    if (selectedBlog != null) {
      // listListeningExercise.sourceGenerateWidget.controller.text =
      //     selectedBlog!.storagePath;
      txtkanji.controller.text = selectedBlog!.kanji;
      txtkana.controller.text = selectedBlog!.kana;
      txtpos.controller.text = selectedBlog!.pos;
      txtmeaningMn.controller.text = selectedBlog!.meaningMn;
      txtmeaningEn.controller.text = selectedBlog!.meaningEn;
      txtexample.controller.text = selectedBlog!.example;
      txtexampleMn.controller.text = selectedBlog!.exampleMn;
      txtexampleEn.controller.text = selectedBlog!.exampleEn;
    }

    return Scaffold(
        body: ListView(children: [
      txtkanji,
      txtkana,
      txtpos,
      txtmeaningMn,
      txtmeaningEn,
      txtexample,
      txtexampleMn,
      txtexampleEn,

      // SizedBox(height: 600, width: 500, child: listListeningExercise),
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

  save(JlptWordEntryController controller) {
    // var vocabularies = txtVocabularies.controller.text.split("\n");
    // String storagePath =
    //     listListeningExercise.sourceGenerateWidget.controller.text.trim();
    JlptWord blog = JlptWord(
        kanji: txtkanji.controller.text.trim(),
        kana: txtkana.controller.text.trim(),
        pos: txtpos.controller.text.trim(),
        meaningMn: txtmeaningMn.controller.text.trim(),
        meaningEn: txtmeaningEn.controller.text.trim(),
        example: txtexample.controller.text.trim(),
        exampleMn: txtexampleMn.controller.text.trim(),
        exampleEn: txtexampleEn.controller.text.trim());
    controller.writeNew(selectedBlog == null ? "" : selectedBlog!.key, blog);
    // controller.writeNew(
    //     selectedBlog == null ? "" : selectedBlog!.key,
    //     txtExerciseName.controller.text.trim(),
    //     listListeningExercise.lstQuestion,
    //     vocabularies,
    //     storagePath);
  }
}
