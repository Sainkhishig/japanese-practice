class GrammarModel {
  late String name;
  late String content;
  late String question;
  late List<String> answers;
  late String answer;
  late DateTime writeDate;
  GrammarModel(this.name, this.content, this.question, this.answers,
      this.answer, this.writeDate);
  factory GrammarModel.fromRTDB(Map<String, dynamic> data) {
    // print("datakey");
    // print((data as DataSnapshot).key);
    return GrammarModel(
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