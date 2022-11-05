import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

class CommonDropdown extends HookConsumerWidget {
  CommonDropdown(this.dataSource,
      {Key? key,
      required this.onSelectionChanged,
      this.pickerName = "",
      this.hintText = "сонгох"})
      : super(key: key);

  /// 検索機能
  final Function(Object? selectedValue)? onSelectionChanged;
  final List<DropdownMenuItem<CommonDropDownModel>> dataSource;

  Object? selectedValue;
  late String pickerName;
  late String hintText;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // var itemSource = getDropItems();
    var hasSelectedValue = selectedValue == null
        ? true
        : dataSource.any((element) => element.value == selectedValue);
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: DropdownButtonHideUnderline(
        child: DropdownButtonFormField(
          dropdownColor: Colors.white,
          hint: Text(hintText),
          isDense: true,
          items: dataSource,
          value: hasSelectedValue ? selectedValue : null,
          onChanged: (value) {
            onSelectionChanged!.call(value);
            // setState(() {
            //   selectedValue = value;
            //   onSelectionChanged!.call(value);
            // });
          },
        ),
      ),
    );
  }
}

class CommonDropDownModel {
  late String id;
  late String name;
  CommonDropDownModel(this.id, this.name);
}
