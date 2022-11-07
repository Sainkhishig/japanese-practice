class ReadingModel {
  late String name;
  late String content;
  late List<Question> questions;

  late DateTime writeDate;
  ReadingModel(this.name, this.content, this.questions, this.writeDate);
  factory ReadingModel.fromRTDB(Map<String, dynamic> data) {
    return ReadingModel(
        data['name'],
        data['content'],
        data['questions'],
        data['writeDate'] != null
            ? DateTime.fromMicrosecondsSinceEpoch(data['writeDate'])
            : DateTime.now());
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
