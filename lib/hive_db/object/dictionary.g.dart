// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dictionary.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DictionaryAdapter extends TypeAdapter<Dictionary> {
  @override
  final int typeId = 0;

  @override
  Dictionary read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Dictionary()
      ..level = fields[0] as int
      ..word = fields[1] as String
      ..translate = fields[2] as String
      ..kanji = fields[3] as String
      ..example = fields[4] as String
      ..exampleTr = fields[5] as String;
  }

  @override
  void write(BinaryWriter writer, Dictionary obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.level)
      ..writeByte(1)
      ..write(obj.word)
      ..writeByte(2)
      ..write(obj.translate)
      ..writeByte(3)
      ..write(obj.kanji)
      ..writeByte(4)
      ..write(obj.example)
      ..writeByte(5)
      ..write(obj.exampleTr);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DictionaryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
