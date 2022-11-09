import 'package:freezed_annotation/freezed_annotation.dart';

part 'vocabulary_state.freezed.dart';
part 'vocabulary_state.g.dart';

@freezed
abstract class VocabularyState with _$VocabularyState {
  const factory VocabularyState({
    @Default([]) List<dynamic> lstTableServingProgress,
    @Default(1) int selectedCardIndex,
    @Default(1) int jlptLevel,
    @Default(null) dynamic selectedExerciseData,
  }) = _VocabularyState;
  factory VocabularyState.fromJson(Map<String, dynamic> json) =>
      _$VocabularyStateFromJson(json);
}
