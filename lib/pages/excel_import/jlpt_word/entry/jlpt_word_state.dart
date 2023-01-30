import 'package:freezed_annotation/freezed_annotation.dart';

part 'jlpt_word_state.freezed.dart';
part 'jlpt_word_state.g.dart';

@freezed
abstract class JlptWordState with _$JlptWordState {
  const factory JlptWordState({
    @Default([]) List<dynamic> lstTableServingProgress,
    @Default(1) int selectedCardIndex,
    @Default(1) int jlptLevel,
    @Default(null) dynamic selectedExerciseData,
  }) = _JlptWordState;
  factory JlptWordState.fromJson(Map<String, dynamic> json) =>
      _$JlptWordStateFromJson(json);
}
