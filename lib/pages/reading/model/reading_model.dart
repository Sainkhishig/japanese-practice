class ReadingExercise {
  late String name;
  late List vocabularies;
  late List<Reading> exercises;
  late DateTime writeDate;

  ReadingExercise(this.name, this.vocabularies, this.exercises, this.writeDate);
  factory ReadingExercise.fromRTDB(Map<String, dynamic> data) {
    return ReadingExercise(
        data['name'],
        data['vocabularies'],
        (data['exercises'] as List).map((e) => Reading.fromRTDB(e)).toList(),
        data['time'] != null
            ? DateTime.fromMicrosecondsSinceEpoch(data['time'])
            : DateTime.now());
  }
}

class Reading {
  late String section;
  late String content;
  late List<Question> questions;

  late DateTime writeDate;
  Reading(this.section, this.content, this.questions);
  factory Reading.fromRTDB(Map<String, dynamic> data) {
    return Reading(
      data['section'],
      data['content'],
      (data['questions'] as List).map((e) => Question.fromRTDB(e)).toList(),
    );
  }
}

class Question {
  late String question;
  late List<AnswerOption> answers;

  Question(this.question, this.answers);
  factory Question.fromRTDB(Map<String, dynamic> data) {
    return Question(
      data['question'],
      (data['answers'] as List).map((e) => AnswerOption.fromRTDB(e)).toList(),
    );
  }
  // toJson() {
  //   return {
  //     "question": question,
  //     "answers": answers,
  //   };
  // }
}

class AnswerOption {
  late String answer;
  late bool isTrue;

  AnswerOption(this.answer, this.isTrue);
  factory AnswerOption.fromRTDB(Map<String, dynamic> data) {
    return AnswerOption(
      data['answer'],
      data['isTrue'],
    );
  }
}
