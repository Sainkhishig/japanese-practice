import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'loading_button.dart';

class LoadingSearchBar extends HookConsumerWidget {
  const LoadingSearchBar(
    this.keywordController, {
    Key? key,
    required this.onSearch,
    this.hintText,
    this.widgetKey = "",
  }) : super(key: key);
  final TextEditingController keywordController;

  /// widget key
  final String widgetKey;

  /// 検索機能
  final VoidCallback? onSearch;

  /// hint
  final String? hintText;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    keywordController.selection = TextSelection.fromPosition(
        TextPosition(offset: keywordController.text.length));
    final FocusNode focusNodeForm = FocusNode();

    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Expanded(
        flex: 3,
        child: TextFormField(
            key: Key(widgetKey),
            controller: keywordController,
            autofocus: true,
            focusNode: focusNodeForm,
            textInputAction: TextInputAction.search,
            decoration: InputDecoration(
              isDense: true,
              labelText: hintText ?? "キーワード",
              prefixIcon: const Icon(Icons.search),
              suffixIcon: IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () {
                  keywordController.text = '';
                },
              ),
            ),
            onFieldSubmitted: (_) async => onSearch?.call()),
      ),
      Expanded(
          flex: 1,
          child: Container(
            padding: const EdgeInsets.all(8.0),
            width: 105,
            child: LoadingButton(
              widgetKey: "loadingButton",
              onPressed: () => onSearch?.call(),
              textLabel: '検索',
            ),
          ))
    ]);
  }
}
