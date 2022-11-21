import 'package:freezed_annotation/freezed_annotation.dart';

part 'listening_state.freezed.dart';
part 'listening_state.g.dart';

@freezed
abstract class ListeningState with _$ListeningState {
  const factory ListeningState({
    @Default([]) List<dynamic> lstTableServingProgress,
    @Default(1) int selectedCardIndex,
    @Default(null) dynamic selectedExerciseData,
    @Default(1) int jlptLevel,
  }) = _ListeningState;
  factory ListeningState.fromJson(Map<String, dynamic> json) =>
      _$ListeningStateFromJson(json);
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