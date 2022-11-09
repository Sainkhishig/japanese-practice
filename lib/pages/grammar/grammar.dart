import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:japanese_practise_n5/pages/grammar/detail/grammar_detail.dart';
import 'package:japanese_practise_n5/pages/grammar/list/grammar_list.dart';
import 'package:japanese_practise_n5/pages/grammar/list/grammar_list_controller.dart';

// pyafm100: 部屋タイプ RoomType
class GrammarPage extends HookConsumerWidget {
  const GrammarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(grammarListController.notifier);
    ref.watch(grammarListController);
    return Row(
      children: [
        Flexible(
          child: GrammarList(),
        ),
        const VerticalDivider(thickness: 1.0, color: Colors.black12),
        Flexible(
          child: GrammarDetail(
            selectedExerciseData: controller.state.selectedExerciseData,
          ),
        )
      ],
    );
  }
}
