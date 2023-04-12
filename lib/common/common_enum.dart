import 'package:flutter/material.dart';

enum TestType { reading, listening, kanji, vocabulary, grammar }

extension TestTypeExtension on TestType {
  static final typeNames = {
    TestType.reading: 'Уншлага',
    TestType.listening: 'Сонсгол',
    TestType.kanji: 'Ханз',
    TestType.vocabulary: 'Шинэ үг',
    TestType.grammar: 'Дүрэм',
  };

  String get label => typeNames[this]!;

  static final typeIds = {
    TestType.reading: 'ReadingTest',
    TestType.listening: 'ListeningTest',
    TestType.kanji: 'KanjiTest',
    TestType.vocabulary: 'VocabularyTest',
    TestType.grammar: 'GrammarTest',
  };

  String get id => typeIds[this]!;
}
