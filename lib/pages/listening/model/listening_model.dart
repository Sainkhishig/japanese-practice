class ListeningExercise {
  late String key;
  late String name;
  String storagePath = "";

  late int jlptLevel;
  late List vocabularies;
  late List<ListeningQuestion> exercises;
  late DateTime writeDate;

  ListeningExercise(this.name, this.jlptLevel, this.storagePath,
      this.vocabularies, this.exercises, this.writeDate);
  factory ListeningExercise.fromRTDB(Map<String, dynamic> data) {
    return ListeningExercise(
        data['name'] ?? "",
        data['jlptLevel'] ?? 5,
        data['storagePath'] ?? "",
        data['vocabularies'],
        (data['exercises'] as List)
            .map((e) => ListeningQuestion.fromRTDB(e))
            .toList(),
        data['time'] != null
            ? DateTime.fromMicrosecondsSinceEpoch(data['time'])
            : DateTime.now());
  }
}

class ListeningQuestion {
  late String question;
  late String audioPath;
  late String imagePath;
  late String audioUrl;
  late String imageUrl;
  late List<ListeningAnswerOption> answers;

  ListeningQuestion(
      this.question, this.audioPath, this.imagePath, this.answers);
  factory ListeningQuestion.fromRTDB(Map<String, dynamic> data) {
    return ListeningQuestion(
      data['question'],
      data['audioPath'] ?? "",
      data['imagePath'] ?? "",
      (data['answers'] as List)
          .map((e) => ListeningAnswerOption.fromRTDB(e))
          .toList(),
    );
  }
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
