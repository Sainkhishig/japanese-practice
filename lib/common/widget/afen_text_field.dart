import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AfenTextField extends HookConsumerWidget {
  AfenTextField(
    this.lablel, {
    Key? key,
    this.hintText = "",
    this.onValueChanged,
  }) : super(key: key);

  /// 検索機能
  final VoidCallback? onValueChanged;
  final String lablel;
  String hintText = "";

  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StatefulBuilder(builder: (context, setState) {
      return Container(
          width: 400,
          padding: EdgeInsets.all(8),
          // height: 50,
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: TextFormField(
                      controller: controller,
                      autofocus: true,

                      decoration: InputDecoration(
                        hintText: hintText,
                        border: OutlineInputBorder(),
                        isDense: true,
                        labelText: lablel,
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.clear),
                          onPressed: () {
                            controller.text = '';
                          },
                        ),
                      ),
                      // onFieldSubmitted: (_) async => onSearch?.call()
                    ),
                  ),
                ],
              ),
            ],
          ));
    });
  }
}
