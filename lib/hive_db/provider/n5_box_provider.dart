import 'package:japanese_practise_n5/hive_db/boxes/hive_box_class.dart';
import 'package:japanese_practise_n5/hive_db/object/dictionary.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final n5BoxDataProvider = Provider<N5Box>((ref) => throw UnimplementedError());

class N5Box extends HiveBoxClass {
  N5Box(Box box) : super(box) {
    var person = Dictionary()
      ..level = 5
      ..word = "くるま"
      ..kanji = "車"
      ..translate = "машин"
      ..example = "くるまをうんてんするのがすき。"
      ..exampleTr = "Жолоо барих дуртай.";
    var person2 = Dictionary()
      ..level = 5
      ..word = "たまご"
      ..kanji = "卵"
      ..translate = "ӨНДӨГ"
      ..example = "たまごはれいぞこにあります。"
      ..exampleTr = "Өндөг хөргөгчинд байгаа.";
    box.add(person);
    box.add(person2);

    // box.put("n5", Vocabulary(5, "くるま", "машин", "車", "くるまをうんてんするのがすき。"));
    // box.put("n5", Vocabulary(5, "りんご", "алим", "", "りんごをたべたい。"));

    // if (!box.containsKey("branchMaster")) {
    //   box.put("branchMaster", []);
    // }
  }

  // dynamic get lstN5Vocabulary => box.get("n5");
  // int get adminListColumnCount => box.get("adminListColumnCount");
  // set adminListColumnCount(int cnt) => box.put("adminListColumnCount", cnt);
}
