class ListeningExercise {
  late String key;
  late String name;
  late List vocabularies;
  late List<ListeningSection> exercises;
  late DateTime writeDate;

  ListeningExercise(
      this.name, this.vocabularies, this.exercises, this.writeDate);
  factory ListeningExercise.fromRTDB(Map<String, dynamic> data) {
    return ListeningExercise(
        data['name'],
        data['vocabularies'],
        (data['exercises'] as List)
            .map((e) => ListeningSection.fromRTDB(e))
            .toList(),
        data['time'] != null
            ? DateTime.fromMicrosecondsSinceEpoch(data['time'])
            : DateTime.now());
  }
}

class ListeningSection {
  late String section;
  late String content;
  late List<ListeningQuestion> questions;

  late DateTime writeDate;
  ListeningSection(this.section, this.content, this.questions);
  factory ListeningSection.fromRTDB(Map<String, dynamic> data) {
    return ListeningSection(
      data['section'],
      data['content'],
      (data['questions'] as List)
          .map((e) => ListeningQuestion.fromRTDB(e))
          .toList(),
    );
  }
}

class ListeningQuestion {
  late String question;
  late List<ListeningAnswerOption> answers;

  ListeningQuestion(this.question, this.answers);
  factory ListeningQuestion.fromRTDB(Map<String, dynamic> data) {
    return ListeningQuestion(
      data['question'],
      (data['answers'] as List)
          .map((e) => ListeningAnswerOption.fromRTDB(e))
          .toList(),
    );
  }
  // toJson() {
  //   return {
  //     "question": question,
  //     "answers": answers,
  //   };
  // }
}

class ListeningAnswerOption {
  late String answer;
  late bool isTrue;

  ListeningAnswerOption(this.answer, this.isTrue);
  factory ListeningAnswerOption.fromRTDB(Map<String, dynamic> data) {
    return ListeningAnswerOption(
      data['answer'],
      data['isTrue'],
    );
  }
}
