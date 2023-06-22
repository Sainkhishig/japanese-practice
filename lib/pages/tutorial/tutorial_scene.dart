import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:japanese_practise_n5/common/common_widget.dart';
import 'package:japanese_practise_n5/common/widget/afen_checkbox.dart';
import 'package:japanese_practise_n5/common/widget/afen_rich_text_field.dart';
import 'package:japanese_practise_n5/common/widget/afen_text_field.dart';
import 'package:japanese_practise_n5/common/widget/save_button.dart';

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:japanese_practise_n5/pages/tutorial/tutorial_scene_controller.dart';

// pyfm061 : キャンセル規定編集
class TutorialScene extends HookConsumerWidget {
  TutorialScene({Key? key}) : super(key: key);

  List<DropdownMenuItem<String>> getDropItems(Map lstTutorial) {
    List<DropdownMenuItem<String>> lstDropItem = [];
    lstTutorial.forEach((key, value) {
      print("keydropDown:$key");
      print("keydropDownTitle:${value["tutorial"]["title"]}");
      lstDropItem.add(DropdownMenuItem<String>(
          alignment: AlignmentDirectional.center,
          value: key,
          child: Text(
            "${value["tutorial"]["title"]}",
            textAlign: TextAlign.center,
          )));
    });
    // for (var item in ) {
    //   lstDropItem.add(DropdownMenuItem<int>(
    //       alignment: AlignmentDirectional.center,
    //       value: item["title"],
    //       child: Text(
    //         "${item["title"]}",
    //         textAlign: TextAlign.center,
    //       )));
    // }
    // for (var i = 1; i <= 5; i++) {}
    return lstDropItem;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(tutorialSceneController.notifier);
    controller.setModelListenable(ref);

    final future = useMemoized(() => controller.getAllTutorial());
    final snapshot = useFuture(future, initialData: null);

    if (snapshot.hasError) return ErrorWidget(snapshot.error!);
    if (snapshot.connectionState == ConnectionState.waiting) {
      return const Center(child: CircularProgressIndicator());
    }
    return Scaffold(
        body: ListView(children: [
      Container(
        width: 250,
        padding: const EdgeInsets.only(top: 20),
        child: DropdownButtonHideUnderline(
            child: DropdownButtonFormField(
          dropdownColor: Colors.white,
          hint: const Text("Заах хичээл"),
          isDense: true,
          items: getDropItems(controller.state.lstAllTutorial),
          value: controller.jlptLevel,
          onChanged: (value) {
            // var selectedLevel = int.parse("$value");
            // controller.setJlptLevel(selectedLevel);
          },
        )),
      ),
      SaveButton(
        onSave: () async {
          try {
            // await save(controller);
            showSuccessToastMessage(context, "хадгаллаа");
          } catch (ex) {
            showErrorToastMessage(context, "Алдаа гарлаа");
          }
        },
      )
    ]));
  }
}
