import 'package:freezed_annotation/freezed_annotation.dart';

part 'reading_state.freezed.dart';
part 'reading_state.g.dart';

@freezed
abstract class ReadingState with _$ReadingState {
  const factory ReadingState({
    @Default([]) List<dynamic> lstTableServingProgress,
    @Default(1) int selectedCardIndex,
    @Default(1) int jlptLevel,
  }) = _ReadingState;
  factory ReadingState.fromJson(Map<String, dynamic> json) =>
      _$ReadingStateFromJson(json);
}
// {
//       'level': 5,
//       'word': "ほん",
//       'kanji': "本",
//       'translation': "ном",
//       'example': "つくえのに本がふたつあります。",
//       'example_en': "つくえのに本がふたつあります。",
//       'example_mn': "Ширээн дээр ном 2 ширхэг байна.",
//       'time': DateTime.now().microsecondsSinceEpoch
//     };