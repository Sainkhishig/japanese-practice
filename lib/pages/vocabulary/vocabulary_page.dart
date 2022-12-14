import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:japanese_practise_n5/pages/vocabulary/detail/vocabulary_detail.dart';
import 'package:japanese_practise_n5/pages/vocabulary/list/vocabulary_list.dart';
import 'package:japanese_practise_n5/pages/vocabulary/list/vocabulary_list_controller.dart';

// pyafm100: 部屋タイプ RoomType
class VocabularyPage extends HookConsumerWidget {
  const VocabularyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(vocabularyListController.notifier);
    ref.watch(vocabularyListController);
    return Row(
      children: [
        Flexible(
          child: VocabularyList(),
        ),
        const VerticalDivider(thickness: 1.0, color: Colors.black12),
        Flexible(
          child: VocabularyDetail(
            selectedExerciseData: controller.state.selectedExerciseData,
          ),
        )
      ],
    );
  }
}
