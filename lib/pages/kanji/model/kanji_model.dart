import 'package:japanese_practise_n5/pages/reading/model/reading_model.dart';

class KanjiExercise {
  late String key;
  late String name;
  late int jlptLevel;
  late List vocabularies;
  late List<Question> exercises;
  late DateTime writeDate;

  KanjiExercise(this.name, this.jlptLevel, this.vocabularies, this.exercises,
      this.writeDate);
  factory KanjiExercise.fromRTDB(Map<String, dynamic> data) {
    return KanjiExercise(
        data['name'],
        data['jlptLevel'] ?? 5,
        data['vocabularies'],
        (data['exercises'] as List).map((e) => Question.fromRTDB(e)).toList(),
        data['time'] != null
            ? DateTime.fromMicrosecondsSinceEpoch(data['time'])
            : DateTime.now());
  }
}
