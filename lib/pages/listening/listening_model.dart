import 'package:freezed_annotation/freezed_annotation.dart';

part 'listening_model.freezed.dart';
part 'listening_model.g.dart';

@freezed
abstract class ListeningModel with _$ListeningModel {
  const factory ListeningModel({
    @Default([]) List<dynamic> lstListeningData,
    @Default(1) int selectedCardIndex,
    @Default(1) int jlptLevel,
  }) = _ListeningModel;
  factory ListeningModel.fromJson(Map<String, dynamic> json) =>
      _$ListeningModelFromJson(json);
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