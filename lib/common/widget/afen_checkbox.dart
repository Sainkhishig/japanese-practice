import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AfenCheckbox extends HookConsumerWidget {
  AfenCheckbox(
    this.isChecked, {
    Key? key,
    this.onValueChanged,
  }) : super(key: key);

  /// 検索機能
  final VoidCallback? onValueChanged;
  bool isChecked;

  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StatefulBuilder(builder: (context, setState) {
      return Checkbox(
        checkColor: Colors.white,
        value: isChecked,
        onChanged: (bool? value) {
          setState(() {
            isChecked = value!;
            // onValueChanged!.call();
          });
        },
      );
    });
  }
}
