// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'reading_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ReadingState _$ReadingStateFromJson(Map<String, dynamic> json) {
  return _ReadingState.fromJson(json);
}

/// @nodoc
class _$ReadingStateTearOff {
  const _$ReadingStateTearOff();

  _ReadingState call(
      {List<dynamic> lstTableServingProgress = const [],
      int selectedCardIndex = 1,
      int jlptLevel = 1}) {
    return _ReadingState(
      lstTableServingProgress: lstTableServingProgress,
      selectedCardIndex: selectedCardIndex,
      jlptLevel: jlptLevel,
    );
  }

  ReadingState fromJson(Map<String, Object> json) {
    return ReadingState.fromJson(json);
  }
}

/// @nodoc
const $ReadingState = _$ReadingStateTearOff();

/// @nodoc
mixin _$ReadingState {
  List<dynamic> get lstTableServingProgress =>
      throw _privateConstructorUsedError;
  int get selectedCardIndex => throw _privateConstructorUsedError;
  int get jlptLevel => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReadingStateCopyWith<ReadingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReadingStateCopyWith<$Res> {
  factory $ReadingStateCopyWith(
          ReadingState value, $Res Function(ReadingState) then) =
      _$ReadingStateCopyWithImpl<$Res>;
  $Res call(
      {List<dynamic> lstTableServingProgress,
      int selectedCardIndex,
      int jlptLevel});
}

/// @nodoc
class _$ReadingStateCopyWithImpl<$Res> implements $ReadingStateCopyWith<$Res> {
  _$ReadingStateCopyWithImpl(this._value, this._then);

  final ReadingState _value;
  // ignore: unused_field
  final $Res Function(ReadingState) _then;

  @override
  $Res call({
    Object? lstTableServingProgress = freezed,
    Object? selectedCardIndex = freezed,
    Object? jlptLevel = freezed,
  }) {
    return _then(_value.copyWith(
      lstTableServingProgress: lstTableServingProgress == freezed
          ? _value.lstTableServingProgress
          : lstTableServingProgress // ignore: cast_nullable_to_non_nullable
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
abstract class _$ReadingStateCopyWith<$Res>
    implements $ReadingStateCopyWith<$Res> {
  factory _$ReadingStateCopyWith(
          _ReadingState value, $Res Function(_ReadingState) then) =
      __$ReadingStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<dynamic> lstTableServingProgress,
      int selectedCardIndex,
      int jlptLevel});
}

/// @nodoc
class __$ReadingStateCopyWithImpl<$Res> extends _$ReadingStateCopyWithImpl<$Res>
    implements _$ReadingStateCopyWith<$Res> {
  __$ReadingStateCopyWithImpl(
      _ReadingState _value, $Res Function(_ReadingState) _then)
      : super(_value, (v) => _then(v as _ReadingState));

  @override
  _ReadingState get _value => super._value as _ReadingState;

  @override
  $Res call({
    Object? lstTableServingProgress = freezed,
    Object? selectedCardIndex = freezed,
    Object? jlptLevel = freezed,
  }) {
    return _then(_ReadingState(
      lstTableServingProgress: lstTableServingProgress == freezed
          ? _value.lstTableServingProgress
          : lstTableServingProgress // ignore: cast_nullable_to_non_nullable
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
class _$_ReadingState implements _ReadingState {
  const _$_ReadingState(
      {this.lstTableServingProgress = const [],
      this.selectedCardIndex = 1,
      this.jlptLevel = 1});

  factory _$_ReadingState.fromJson(Map<String, dynamic> json) =>
      _$$_ReadingStateFromJson(json);

  @JsonKey(defaultValue: const [])
  @override
  final List<dynamic> lstTableServingProgress;
  @JsonKey(defaultValue: 1)
  @override
  final int selectedCardIndex;
  @JsonKey(defaultValue: 1)
  @override
  final int jlptLevel;

  @override
  String toString() {
    return 'ReadingState(lstTableServingProgress: $lstTableServingProgress, selectedCardIndex: $selectedCardIndex, jlptLevel: $jlptLevel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ReadingState &&
            (identical(
                    other.lstTableServingProgress, lstTableServingProgress) ||
                const DeepCollectionEquality().equals(
                    other.lstTableServingProgress, lstTableServingProgress)) &&
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
      const DeepCollectionEquality().hash(lstTableServingProgress) ^
      const DeepCollectionEquality().hash(selectedCardIndex) ^
      const DeepCollectionEquality().hash(jlptLevel);

  @JsonKey(ignore: true)
  @override
  _$ReadingStateCopyWith<_ReadingState> get copyWith =>
      __$ReadingStateCopyWithImpl<_ReadingState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReadingStateToJson(this);
  }
}

abstract class _ReadingState implements ReadingState {
  const factory _ReadingState(
      {List<dynamic> lstTableServingProgress,
      int selectedCardIndex,
      int jlptLevel}) = _$_ReadingState;

  factory _ReadingState.fromJson(Map<String, dynamic> json) =
      _$_ReadingState.fromJson;

  @override
  List<dynamic> get lstTableServingProgress =>
      throw _privateConstructorUsedError;
  @override
  int get selectedCardIndex => throw _privateConstructorUsedError;
  @override
  int get jlptLevel => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ReadingStateCopyWith<_ReadingState> get copyWith =>
      throw _privateConstructorUsedError;
}
