import 'package:freezed_annotation/freezed_annotation.dart';

part 'jlpt_word_list_state.freezed.dart';
part 'jlpt_word_list_state.g.dart';

@freezed
abstract class JlptWordListState with _$JlptWordListState {
  const factory JlptWordListState({
    @Default([]) List<dynamic> lstTableServingProgress,
    @Default(1) int selectedCardIndex,
    @Default(null) dynamic selectedRowData,
    @Default(1) int jlptLevel,
  }) = _JlptWordListState;
  factory JlptWordListState.fromJson(Map<String, dynamic> json) =>
      _$JlptWordListStateFromJson(json);
}
// {
//       'jlptLevel': 5,
//       'word': "ほん",
//       'kanji': "本",
//       'translation': "ном",
//       'example': "つくえのに本がふたつあります。",
//       'example_en': "つくえのに本がふたつあります。",
//       'example_mn': "Ширээн дээр ном 2 ширхэг байна.",
//       'time': DateTime.now().microsecondsSinceEpoch
//     };