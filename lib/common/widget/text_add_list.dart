import 'package:flutter/material.dart';
// import 'package:flutter_reorderable_list/flutter_reorderable_list.dart' as lib;
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:japanese_practise_n5/common/widget/afen_text_field.dart';

enum DraggingMode {
  iOS,
  android,
}

class TextAddList extends HookConsumerWidget {
  TextAddList({
    Key? key,
    required this.onClickAdd,
    required this.lstAnswer,
    this.isRemovable = true,
    this.isCreatable = true,
    this.onItemRemoved,
  }) : super(key: key);
  final List<AsnwerFieldItem> lstAnswer;

  final bool isRemovable;
  final bool isCreatable;

  /// 検索機能

  final AsnwerFieldItem Function() onClickAdd;
  late Function(AsnwerFieldItem removedItem)? onItemRemoved;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //  CustomDraggableCards(List<ImageItem> lstAnswer) {
    // Returns index of item with given key
    int _indexOfKey(Key key) {
      return lstAnswer.indexWhere((AsnwerFieldItem d) => d.key == key);
    }

    return StatefulBuilder(builder: (context, setState) {
      return ListView.builder(
          itemCount: lstAnswer.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: Row(children: [
                Expanded(
                    flex: 5,
                    child: _buildRowItem(
                      setState,
                      lstAnswer[index],
                    )),
              ]),
            );
          });
    });
  }

  Widget _buildRowItem(StateSetter setState, AsnwerFieldItem rowItem) {
    Widget content = SafeArea(
      top: false,
      bottom: false,
      child: Opacity(
        // hide content for placeholder
        opacity: 1.0,
        child: IntrinsicHeight(
            child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
                child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 5,
                    child: Row(
                      children: [rowItem.field],
                    ),
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
            )),
          ],
        )),
      ),
    );

    return content;
  }
}

class AsnwerFieldItem {
  AsnwerFieldItem(this.field, this.key);
  final AfenTextField field;
  final Key key;

  AsnwerFieldItem.clone(AsnwerFieldItem randomObject)
      : this(randomObject.field, randomObject.key);
}
