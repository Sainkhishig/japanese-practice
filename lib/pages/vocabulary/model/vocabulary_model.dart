import 'package:japanese_practise_n5/pages/reading/model/reading_model.dart';

class VocabularyExercise {
  late String key;
  late int jlptLevel;
  late String name;
  late List vocabularies;
  late List<Question> exercises;
  late DateTime writeDate;

  VocabularyExercise(this.name, this.jlptLevel, this.vocabularies,
      this.exercises, this.writeDate);
  factory VocabularyExercise.fromRTDB(Map<String, dynamic> data) {
    return VocabularyExercise(
        data['name'],
        data['jlptLevel'] ?? 5,
        data['vocabularies'],
        (data['exercises'] as List).map((e) => Question.fromRTDB(e)).toList(),
        data['time'] != null
            ? DateTime.fromMicrosecondsSinceEpoch(data['time'])
            : DateTime.now());
  }
}
