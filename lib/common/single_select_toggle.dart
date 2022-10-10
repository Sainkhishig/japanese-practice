import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SingleSelectToggleController extends HookConsumerWidget {
  const SingleSelectToggleController(this.onSelect, this.dataSource,
      {Key? key,
      this.height = 30,
      this.selectedIndex,
      this.padding = const EdgeInsets.only(top: 10)})
      : super(key: key);

  /// 検索機能
  final VoidCallback? onSelect;
  final List<SingleSelectToggleModel> dataSource;
  final int height;
  final int? selectedIndex;
  final EdgeInsets padding;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var lstToggle = dataSource
        .map((e) => Padding(
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: Text(e.name)))
        .toList();
    var values = dataSource.map((e) => e.isSelected).toList();
    if (selectedIndex != null) {
      values[selectedIndex ?? 0] = true;
    }
    return StatefulBuilder(builder: (context, setState) {
      return Padding(
          padding: padding,
          child: Container(
              height: 30,
              child: ToggleButtons(
                children: lstToggle,
                isSelected: values,
                onPressed: (int index) {
                  setState(() {
                    // singleSelect
                    for (int i = 0; i < values.length; i++) {
                      values[i] = i == index;
                    }
                    // multiSelect
                    // values[index] = !values[index];
                  });
                },
                selectedColor: Colors.white,
                fillColor: Colors.yellow,
                borderRadius: BorderRadius.all(Radius.circular(15)),
              )));
    });
  }
}

class SingleSelectToggleModel {
  String name;
  bool isSelected;
  SingleSelectToggleModel(this.name, this.isSelected);
}
