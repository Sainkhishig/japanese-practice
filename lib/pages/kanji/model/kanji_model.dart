import 'package:japanese_practise_n5/pages/reading/model/reading_model.dart';

class KanjiExercise {
  late String key;
  late String name;
  late List vocabularies;
  late List<Question> exercises;
  late DateTime writeDate;

  KanjiExercise(this.name, this.vocabularies, this.exercises, this.writeDate);
  factory KanjiExercise.fromRTDB(Map<String, dynamic> data) {
    return KanjiExercise(
        data['name'],
        data['vocabularies'],
        (data['exercises'] as List).map((e) => Question.fromRTDB(e)).toList(),
        data['time'] != null
            ? DateTime.fromMicrosecondsSinceEpoch(data['time'])
            : DateTime.now());
  }
}

// class KanjiQuestion {
//   late String question;
//   late List<KanjiAnswerOption> answers;

//   KanjiQuestion(this.question, this.answers);
//   factory KanjiQuestion.fromRTDB(Map<String, dynamic> data) {
//     return KanjiQuestion(
//       data['question'],
//       (data['answers'] as List)
//           .map((e) => KanjiAnswerOption.fromRTDB(e))
//           .toList(),
//     );
//   }
// }

// class KanjiAnswerOption {
//   late String answer;
//   late bool isTrue;

//   KanjiAnswerOption(this.answer, this.isTrue);
//   factory KanjiAnswerOption.fromRTDB(Map<String, dynamic> data) {
//     return KanjiAnswerOption(
//       data['answer'],
//       data['isTrue'],
//     );
//   }
// }
