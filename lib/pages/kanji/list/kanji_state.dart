import 'package:freezed_annotation/freezed_annotation.dart';

part 'kanji_state.freezed.dart';
part 'kanji_state.g.dart';

@freezed
abstract class KanjiState with _$KanjiState {
  const factory KanjiState({
    @Default([]) List<dynamic> lstTableServingProgress,
    @Default(1) int selectedCardIndex,
    @Default(1) int jlptLevel,
    @Default(null) dynamic selectedExerciseData,
  }) = _KanjiState;
  factory KanjiState.fromJson(Map<String, dynamic> json) =>
      _$KanjiStateFromJson(json);
}
