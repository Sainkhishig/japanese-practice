import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:japanese_practise_n5/pages/listening/detail/listening_detail.dart';
import 'package:japanese_practise_n5/pages/listening/list/listening_list.dart';

import 'package:japanese_practise_n5/pages/reading/list/reading_list_controller.dart';

// pyafm100: 部屋タイプ RoomType
class ListeningTestPage extends HookConsumerWidget {
  const ListeningTestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(readingListController.notifier);
    ref.watch(readingListController);

    // final future = useMemoized(() => controller.setMasterData());
    // final snapshot = useFuture(future, initialData: null);

    // if (snapshot.hasError) return ErrorWidget(snapshot.error!);
    // if (snapshot.connectionState == ConnectionState.waiting) {
    //   return const Center(child: CircularProgressIndicator());
    // }
    return Row(
      children: [
        Flexible(
          child: ListeningList(),
        ),
        Flexible(
          child: ListeningDetail(
            selectedExerciseData: controller.state.selectedExerciseData,
          ),
        )
      ],
    );
  }
}
