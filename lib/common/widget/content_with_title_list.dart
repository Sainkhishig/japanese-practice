import 'package:flutter/material.dart';
// import 'package:flutter_reorderable_list/flutter_reorderable_list.dart' as lib;
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:japanese_practise_n5/common/widget/afen_rich_text_field.dart';
import 'package:japanese_practise_n5/common/widget/afen_text_field.dart';

enum DraggingMode {
  iOS,
  android,
}

class ContentWithTitleAddList extends HookConsumerWidget {
  ContentWithTitleAddList({
    Key? key,
    this.title = "",
    required this.onClickAdd,
    required this.lstContents,
    this.isRemovable = true,
    this.isCreatable = true,
    this.onItemRemoved,
  }) : super(key: key);
  final List<ContentFieldItem> lstContents;
  final String title;
  final bool isRemovable;
  final bool isCreatable;

  /// 検索機能

  final ContentFieldItem Function() onClickAdd;
  late Function(ContentFieldItem removedItem)? onItemRemoved;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //  CustomDraggableCards(List<ImageItem> lstContents) {
    // Returns index of item with given key
    int _indexOfKey(Key key) {
      return lstContents.indexWhere((ContentFieldItem d) => d.key == key);
    }

    return StatefulBuilder(builder: (context, setState) {
      return ListView.builder(
          itemCount: lstContents.length,
          // shrinkWrap: true,
          // physics: const NeverScrollableScrollPhysics(),
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
                    lstContents[index],
                  )),
            ]);
          });
    });
  }

  Widget _buildRowItem(StateSetter setState, ContentFieldItem rowItem) {
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
                      children: [rowItem.titleField, rowItem.contentField],
                    ),
                  ),
                  Visibility(
                    visible: lstContents.length != 1 && isRemovable,
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
                            lstContents.remove(rowItem);
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
                            lstContents.add(newItem);
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

class ContentFieldItem {
  ContentFieldItem(this.titleField, this.contentField, this.key);
  final AfenTextField titleField;
  final AfenRichTextField contentField;
  final Key key;

  ContentFieldItem.clone(ContentFieldItem randomObject)
      : this(randomObject.titleField, randomObject.contentField,
            randomObject.key);
}
