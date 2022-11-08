import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:japanese_practise_n5/common/widget/afen_checkbox.dart';
import 'package:japanese_practise_n5/common/widget/afen_text_field.dart';

enum DraggingMode {
  iOS,
  android,
}

class AnswerOptionList extends HookConsumerWidget {
  AnswerOptionList({
    Key? key,
    this.title = "",
    required this.onClickAdd,
    required this.lstAnswer,
    this.isRemovable = true,
    this.isCreatable = true,
    this.onItemRemoved,
  }) : super(key: key);
  final List<AsnwerOptionFieldItem> lstAnswer;
  final String title;
  final bool isRemovable;
  final bool isCreatable;

  /// 検索機能

  final AsnwerOptionFieldItem Function() onClickAdd;
  late Function(AsnwerOptionFieldItem removedItem)? onItemRemoved;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int _indexOfKey(Key key) {
      return lstAnswer.indexWhere((AsnwerOptionFieldItem d) => d.key == key);
    }

    return StatefulBuilder(builder: (context, setState) {
      return ListView.builder(
          itemCount: lstAnswer.length,
          itemBuilder: (BuildContext context, int index) {
            return Row(children: [
              Visibility(
                visible: title.isNotEmpty,
                child: Text(title),
              ),
              Expanded(
                  flex: 5,
                  child: _buildRowItem(
                    setState,
                    lstAnswer[index],
                  )),
            ]);
          });
    });
  }

  Widget _buildRowItem(StateSetter setState, AsnwerOptionFieldItem rowItem) {
    Widget content = Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(flex: 5, child: rowItem.field),
          rowItem.checkField,
          const SizedBox(
            width: 5,
          ),
          Visibility(
            visible: lstAnswer.length != 1 && isRemovable,
            child: IconButton(
              icon: const Icon(
                Icons.indeterminate_check_box,
                color: Colors.blue,
                size: 30,
              ),
              tooltip: 'remove action',
              onPressed: () {
                setState(
                  () {
                    lstAnswer.remove(rowItem);
                    // onItemRemoved!.call(rowItem);
                  },
                );
              },
            ),
          ),
          const SizedBox(
            width: 10,
            height: 50,
          ),
          Visibility(
            visible: isCreatable,
            child: IconButton(
              icon: const Icon(
                Icons.add_box,
                color: Colors.blue,
                size: 30,
              ),
              tooltip: 'add action',
              onPressed: () {
                var newItem = onClickAdd.call();

                setState(
                  () {
                    lstAnswer.add(newItem);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );

    return content;
  }
}

class AsnwerOptionFieldItem {
  AsnwerOptionFieldItem(this.field, this.checkField, this.key);
  final AfenTextField field;
  final AfenCheckbox checkField;

  final Key key;

  AsnwerOptionFieldItem.clone(AsnwerOptionFieldItem randomObject)
      : this(randomObject.field, randomObject.checkField, randomObject.key);
}
