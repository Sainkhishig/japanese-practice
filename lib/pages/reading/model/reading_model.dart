class ReadingModel {
  late String name;
  late String content;
  late String question;
  late List<String> answers;
  late String answer;
  late DateTime writeDate;
  ReadingModel(this.name, this.content, this.question, this.answers,
      this.answer, this.writeDate);
  factory ReadingModel.fromRTDB(Map<String, dynamic> data) {
    // print("datakey");
    // print((data as DataSnapshot).key);
    return ReadingModel(
        data['name'],
        data['content'],
        data['question'],
        data['answers'],
        data['answer'],
        data['writeDate'] != null
            ? DateTime.fromMicrosecondsSinceEpoch(data['writeDate'])
            : DateTime.now());
  }
}
