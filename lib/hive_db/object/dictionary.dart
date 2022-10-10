import 'package:hive_flutter/hive_flutter.dart';
part 'dictionary.g.dart';

@HiveType(typeId: 0)
class Dictionary extends HiveObject {
  @HiveField(0)
  late int level;
  @HiveField(1)
  late String word;
  @HiveField(2)
  late String translate;
  @HiveField(3)
  late String kanji;
  @HiveField(4)
  late String example;
  @HiveField(5)
  late String exampleTr;
}
