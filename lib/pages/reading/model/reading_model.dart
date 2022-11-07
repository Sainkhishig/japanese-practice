class ReadingExercise {
  late String name;
  late List<String> vocabularies;
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
      data['name'],
      data['content'],
      (data['questions'] as List).map((e) => Question.fromRTDB(e)).toList(),
    );
  }
}

class Question {
  late String question;
  late String answer;
  late List<String> answers;
  Question(this.question, this.answer, this.answers);
  factory Question.fromRTDB(Map<String, dynamic> data) {
    // print("datakey");
    // print((data as DataSnapshot).key);
    return Question(
      data['question'],
      data['answer'],
      data['answers'],
    );
  }
  toJson() {
    return {
      "question": question,
      "answer": answer,
      "answers": answers,
    };
  }
}
