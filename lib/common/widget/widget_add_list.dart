import 'package:flutter/material.dart';
// import 'package:flutter_reorderable_list/flutter_reorderable_list.dart' as lib;
import 'package:hooks_riverpod/hooks_riverpod.dart';

enum DraggingMode {
  iOS,
  android,
}

class WidgetAddList extends HookConsumerWidget {
  WidgetAddList({
    Key? key,
    required this.onClickAdd,
    required this.widgetItems,
    this.isRemovable = true,
    this.isCreatable = true,
    this.onItemRemoved,
  }) : super(key: key);
  final List<WidgetGroupItem> widgetItems;

  final bool isRemovable;
  final bool isCreatable;

  /// 検索機能

  final WidgetGroupItem Function() onClickAdd;
  late Function(WidgetGroupItem removedItem)? onItemRemoved;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //  CustomDraggableCards(List<ImageItem> widgetItems) {
    // Returns index of item with given key
    int _indexOfKey(Key key) {
      return widgetItems.indexWhere((WidgetGroupItem d) => d.key == key);
    }

    return StatefulBuilder(builder: (context, setState) {
      return ListView.builder(
          itemCount: widgetItems.length,
          shrinkWrap: true,
          // physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return //
                Card(
                    child: //Text("data")
                        ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Visibility(
                    visible: widgetItems.length != 1 && isRemovable,
                    child: IconButton(
                      icon: const Icon(
                        Icons.indeterminate_check_box,
                        // color: LightTheme.primary,
                        size: 30,
                      ),
                      tooltip: 'remove action',
                      onPressed: () {
                        setState(
                          () {
                            widgetItems.remove(widgetItems[index]);
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
                        // color: LightTheme.primary,
                        size: 30,
                      ),
                      tooltip: 'add action',
                      onPressed: () {
                        var newItem = onClickAdd.call();

                        setState(
                          () {
                            widgetItems.add(newItem);
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
              subtitle: Row(children: [
                Expanded(flex: 5, child: widgetItems[index].widget),
              ]),
            ));
          });
    });
  }

  // Widget _buildRowItem(StateSetter setState, WidgetGroupItem rowItem) {
  //   Widget content = Expanded(
  //       child: Padding(
  //     padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
  //     child: Column(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       crossAxisAlignment: CrossAxisAlignment.center,
  //       children: [
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.end,
  //           children: [
  //             Visibility(
  //               visible: widgetItems.length != 1 && isRemovable,
  //               child: IconButton(
  //                 icon: const Icon(
  //                   Icons.indeterminate_check_box,
  //                   // color: LightTheme.primary,
  //                   size: 30,
  //                 ),
  //                 tooltip: 'remove action',
  //                 onPressed: () {
  //                   setState(
  //                     () {
  //                       widgetItems.remove(rowItem);
  //                       // onItemRemoved!.call(rowItem);
  //                     },
  //                   );
  //                 },
  //               ),
  //             ),
  //             const SizedBox(
  //               width: 10,
  //               height: 50,
  //             ),
  //             Visibility(
  //               visible: isCreatable,
  //               child: IconButton(
  //                 icon: const Icon(
  //                   Icons.add_box,
  //                   // color: LightTheme.primary,
  //                   size: 30,
  //                 ),
  //                 tooltip: 'add action',
  //                 onPressed: () {
  //                   var newItem = onClickAdd.call();

  //                   setState(
  //                     () {
  //                       widgetItems.add(newItem);
  //                     },
  //                   );
  //                 },
  //               ),
  //             ),
  //           ],
  //         ),
  //         Expanded(flex: 5, child: rowItem.widget),
  //       ],
  //     ),
  //   ));

  //   return content;
  // }
}

class WidgetGroupItem {
  WidgetGroupItem(this.widget, this.key);

  final Widget widget;

  // Each item in reorderable list needs stable and unique key
  final Key key;

  WidgetGroupItem.clone(WidgetGroupItem randomObject)
      : this(randomObject.widget, randomObject.key);
}
