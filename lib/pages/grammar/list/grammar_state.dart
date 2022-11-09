import 'package:freezed_annotation/freezed_annotation.dart';

part 'grammar_state.freezed.dart';
part 'grammar_state.g.dart';

@freezed
abstract class GrammarState with _$GrammarState {
  const factory GrammarState({
    @Default([]) List<dynamic> lstTableServingProgress,
    @Default(1) int selectedCardIndex,
    @Default(1) int jlptLevel,
    @Default(null) dynamic selectedExerciseData,
  }) = _GrammarState;
  factory GrammarState.fromJson(Map<String, dynamic> json) =>
      _$GrammarStateFromJson(json);
}
