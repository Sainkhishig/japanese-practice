import 'package:japanese_practise_n5/pages/reading/model/reading_model.dart';

class GrammarExercise {
  late String key;
  late String name;
  late List vocabularies;
  late List<Question> exercises;
  late DateTime writeDate;

  GrammarExercise(this.name, this.vocabularies, this.exercises, this.writeDate);
  factory GrammarExercise.fromRTDB(Map<String, dynamic> data) {
    return GrammarExercise(
        data['name'],
        data['vocabularies'],
        (data['exercises'] as List).map((e) => Question.fromRTDB(e)).toList(),
        data['time'] != null
            ? DateTime.fromMicrosecondsSinceEpoch(data['time'])
            : DateTime.now());
  }
}
