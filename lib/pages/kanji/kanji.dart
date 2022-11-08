import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:japanese_practise_n5/pages/kanji/detail/kanji_detail.dart';
import 'package:japanese_practise_n5/pages/kanji/list/kanji_list.dart';
import 'package:japanese_practise_n5/pages/kanji/list/kanji_list_controller.dart';

// pyafm100: 部屋タイプ RoomType
class KanjiPage extends HookConsumerWidget {
  const KanjiPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(kanjiListController.notifier);
    ref.watch(kanjiListController);

    // final future = useMemoized(() => controller.setMasterData());
    // final snapshot = useFuture(future, initialData: null);

    // if (snapshot.hasError) return ErrorWidget(snapshot.error!);
    // if (snapshot.connectionState == ConnectionState.waiting) {
    //   return const Center(child: CircularProgressIndicator());
    // }
    return Row(
      children: [
        Flexible(
          child: KanjiList(),
        ),
        Flexible(
          child: KanjiDetail(
            selectedExerciseData: controller.state.selectedExerciseData,
          ),
        )
      ],
    );
  }
}
