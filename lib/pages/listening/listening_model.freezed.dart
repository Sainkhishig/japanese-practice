// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'listening_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ListeningModel _$ListeningModelFromJson(Map<String, dynamic> json) {
  return _ListeningModel.fromJson(json);
}

/// @nodoc
class _$ListeningModelTearOff {
  const _$ListeningModelTearOff();

  _ListeningModel call(
      {List<dynamic> lstListeningData = const [],
      int selectedCardIndex = 1,
      int jlptLevel = 1}) {
    return _ListeningModel(
      lstListeningData: lstListeningData,
      selectedCardIndex: selectedCardIndex,
      jlptLevel: jlptLevel,
    );
  }

  ListeningModel fromJson(Map<String, Object> json) {
    return ListeningModel.fromJson(json);
  }
}

/// @nodoc
const $ListeningModel = _$ListeningModelTearOff();

/// @nodoc
mixin _$ListeningModel {
  List<dynamic> get lstListeningData => throw _privateConstructorUsedError;
  int get selectedCardIndex => throw _privateConstructorUsedError;
  int get jlptLevel => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ListeningModelCopyWith<ListeningModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListeningModelCopyWith<$Res> {
  factory $ListeningModelCopyWith(
          ListeningModel value, $Res Function(ListeningModel) then) =
      _$ListeningModelCopyWithImpl<$Res>;
  $Res call(
      {List<dynamic> lstListeningData, int selectedCardIndex, int jlptLevel});
}

/// @nodoc
class _$ListeningModelCopyWithImpl<$Res>
    implements $ListeningModelCopyWith<$Res> {
  _$ListeningModelCopyWithImpl(this._value, this._then);

  final ListeningModel _value;
  // ignore: unused_field
  final $Res Function(ListeningModel) _then;

  @override
  $Res call({
    Object? lstListeningData = freezed,
    Object? selectedCardIndex = freezed,
    Object? jlptLevel = freezed,
  }) {
    return _then(_value.copyWith(
      lstListeningData: lstListeningData == freezed
          ? _value.lstListeningData
          : lstListeningData // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      selectedCardIndex: selectedCardIndex == freezed
          ? _value.selectedCardIndex
          : selectedCardIndex // ignore: cast_nullable_to_non_nullable
              as int,
      jlptLevel: jlptLevel == freezed
          ? _value.jlptLevel
          : jlptLevel // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$ListeningModelCopyWith<$Res>
    implements $ListeningModelCopyWith<$Res> {
  factory _$ListeningModelCopyWith(
          _ListeningModel value, $Res Function(_ListeningModel) then) =
      __$ListeningModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<dynamic> lstListeningData, int selectedCardIndex, int jlptLevel});
}

/// @nodoc
class __$ListeningModelCopyWithImpl<$Res>
    extends _$ListeningModelCopyWithImpl<$Res>
    implements _$ListeningModelCopyWith<$Res> {
  __$ListeningModelCopyWithImpl(
      _ListeningModel _value, $Res Function(_ListeningModel) _then)
      : super(_value, (v) => _then(v as _ListeningModel));

  @override
  _ListeningModel get _value => super._value as _ListeningModel;

  @override
  $Res call({
    Object? lstListeningData = freezed,
    Object? selectedCardIndex = freezed,
    Object? jlptLevel = freezed,
  }) {
    return _then(_ListeningModel(
      lstListeningData: lstListeningData == freezed
          ? _value.lstListeningData
          : lstListeningData // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      selectedCardIndex: selectedCardIndex == freezed
          ? _value.selectedCardIndex
          : selectedCardIndex // ignore: cast_nullable_to_non_nullable
              as int,
      jlptLevel: jlptLevel == freezed
          ? _value.jlptLevel
          : jlptLevel // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ListeningModel implements _ListeningModel {
  const _$_ListeningModel(
      {this.lstListeningData = const [],
      this.selectedCardIndex = 1,
      this.jlptLevel = 1});

  factory _$_ListeningModel.fromJson(Map<String, dynamic> json) =>
      _$$_ListeningModelFromJson(json);

  @JsonKey(defaultValue: const [])
  @override
  final List<dynamic> lstListeningData;
  @JsonKey(defaultValue: 1)
  @override
  final int selectedCardIndex;
  @JsonKey(defaultValue: 1)
  @override
  final int jlptLevel;

  @override
  String toString() {
    return 'ListeningModel(lstListeningData: $lstListeningData, selectedCardIndex: $selectedCardIndex, jlptLevel: $jlptLevel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ListeningModel &&
            (identical(other.lstListeningData, lstListeningData) ||
                const DeepCollectionEquality()
                    .equals(other.lstListeningData, lstListeningData)) &&
            (identical(other.selectedCardIndex, selectedCardIndex) ||
                const DeepCollectionEquality()
                    .equals(other.selectedCardIndex, selectedCardIndex)) &&
            (identical(other.jlptLevel, jlptLevel) ||
                const DeepCollectionEquality()
                    .equals(other.jlptLevel, jlptLevel)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(lstListeningData) ^
      const DeepCollectionEquality().hash(selectedCardIndex) ^
      const DeepCollectionEquality().hash(jlptLevel);

  @JsonKey(ignore: true)
  @override
  _$ListeningModelCopyWith<_ListeningModel> get copyWith =>
      __$ListeningModelCopyWithImpl<_ListeningModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ListeningModelToJson(this);
  }
}

abstract class _ListeningModel implements ListeningModel {
  const factory _ListeningModel(
      {List<dynamic> lstListeningData,
      int selectedCardIndex,
      int jlptLevel}) = _$_ListeningModel;

  factory _ListeningModel.fromJson(Map<String, dynamic> json) =
      _$_ListeningModel.fromJson;

  @override
  List<dynamic> get lstListeningData => throw _privateConstructorUsedError;
  @override
  int get selectedCardIndex => throw _privateConstructorUsedError;
  @override
  int get jlptLevel => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ListeningModelCopyWith<_ListeningModel> get copyWith =>
      throw _privateConstructorUsedError;
}
