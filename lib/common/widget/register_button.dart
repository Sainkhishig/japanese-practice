import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RegisterButton extends HookConsumerWidget {
  const RegisterButton({
    Key? key,
    required this.onClick,
  }) : super(key: key);

  /// 押した時の動作
  final VoidCallback? onClick;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final loginRole = ref.read(loginStateNotifierProvider).role;
    // final visible = [ROOT_ADMIN].contains(loginRole);
    const visible = true;

    return Visibility(
      visible: visible,
      child: SizedBox(
        width: 90,
        child: ElevatedButton(
            // key: const Key("registrationButton"),
            child: const Text("Нэмэх"),
            onPressed: onClick),
      ),
    );
  }
}
