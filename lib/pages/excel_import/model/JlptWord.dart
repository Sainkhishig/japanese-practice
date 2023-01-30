import 'dart:core';

// Kanji	Kana	POS	Утга	Meaning	Example	Жишээ
class JlptWord {
  late String key, level;
  late String kanji,
      kana,
      pos,
      meaningMn,
      meaningEn,
      example,
      exampleMn,
      exampleEn;
  JlptWord({
    required this.kanji,
    required this.kana,
    required this.pos,
    required this.meaningMn,
    required this.meaningEn,
    required this.example,
    required this.exampleMn,
    required this.exampleEn,
  });

  factory JlptWord.fromRTDB(Map<String, dynamic> data) {
    return JlptWord(
        kanji: data['kanji'] ?? "",
        kana: data['kana'] ?? "",
        pos: data['pos'] ?? "",
        meaningMn: data['meaningMn'] ?? "",
        meaningEn: data['meaningEn'] ?? "",
        example: data['example'] ?? "",
        exampleMn: data['exampleMn'] ?? "",
        exampleEn: data['exampleEn']);
  }
}
