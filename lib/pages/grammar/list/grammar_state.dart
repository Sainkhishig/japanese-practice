import 'package:freezed_annotation/freezed_annotation.dart';

part 'grammar_state.freezed.dart';
part 'grammar_state.g.dart';

@freezed
abstract class GrammarState with _$GrammarState {
  const factory GrammarState({
    @Default([]) List<dynamic> lstGrammar,
    @Default(1) int selectedCardIndex,
    @Default(null) dynamic selectedExerciseData,
    @Default(1) int jlptLevel,
  }) = _GrammarState;
  factory GrammarState.fromJson(Map<String, dynamic> json) =>
      _$GrammarStateFromJson(json);
}
