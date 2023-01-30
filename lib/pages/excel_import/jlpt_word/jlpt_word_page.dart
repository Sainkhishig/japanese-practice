import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:japanese_practise_n5/pages/excel_import/jlpt_word/entry/jlpt_word_entry.dart';
import 'package:japanese_practise_n5/pages/excel_import/jlpt_word/list/jlpt_word_list.dart';
import 'package:japanese_practise_n5/pages/excel_import/jlpt_word/list/jlpt_word_list_controller.dart';

// pyafm100: 部屋タイプ RoomType
class JlptWordPage extends HookConsumerWidget {
  const JlptWordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(jlptWordListController.notifier);
    ref.watch(jlptWordListController);

    return Row(
      children: [
        Flexible(
          child: JlptWordList(),
        ),
        Flexible(
          child: JlptWordEntry(
            selectedBlog: controller.state.selectedRowData,
          ),
        )
      ],
    );
  }
}
