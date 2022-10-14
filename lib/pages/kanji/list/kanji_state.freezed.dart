// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'kanji_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

KanjiState _$KanjiStateFromJson(Map<String, dynamic> json) {
  return _KanjiState.fromJson(json);
}

/// @nodoc
class _$KanjiStateTearOff {
  const _$KanjiStateTearOff();

  _KanjiState call(
      {List<dynamic> lstTableServingProgress = const [],
      int selectedCardIndex = 1,
      int jlptLevel = 1}) {
    return _KanjiState(
      lstTableServingProgress: lstTableServingProgress,
      selectedCardIndex: selectedCardIndex,
      jlptLevel: jlptLevel,
    );
  }

  KanjiState fromJson(Map<String, Object> json) {
    return KanjiState.fromJson(json);
  }
}

/// @nodoc
const $KanjiState = _$KanjiStateTearOff();

/// @nodoc
mixin _$KanjiState {
  List<dynamic> get lstTableServingProgress =>
      throw _privateConstructorUsedError;
  int get selectedCardIndex => throw _privateConstructorUsedError;
  int get jlptLevel => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $KanjiStateCopyWith<KanjiState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KanjiStateCopyWith<$Res> {
  factory $KanjiStateCopyWith(
          KanjiState value, $Res Function(KanjiState) then) =
      _$KanjiStateCopyWithImpl<$Res>;
  $Res call(
      {List<dynamic> lstTableServingProgress,
      int selectedCardIndex,
      int jlptLevel});
}

/// @nodoc
class _$KanjiStateCopyWithImpl<$Res> implements $KanjiStateCopyWith<$Res> {
  _$KanjiStateCopyWithImpl(this._value, this._then);

  final KanjiState _value;
  // ignore: unused_field
  final $Res Function(KanjiState) _then;

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
abstract class _$KanjiStateCopyWith<$Res> implements $KanjiStateCopyWith<$Res> {
  factory _$KanjiStateCopyWith(
          _KanjiState value, $Res Function(_KanjiState) then) =
      __$KanjiStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<dynamic> lstTableServingProgress,
      int selectedCardIndex,
      int jlptLevel});
}

/// @nodoc
class __$KanjiStateCopyWithImpl<$Res> extends _$KanjiStateCopyWithImpl<$Res>
    implements _$KanjiStateCopyWith<$Res> {
  __$KanjiStateCopyWithImpl(
      _KanjiState _value, $Res Function(_KanjiState) _then)
      : super(_value, (v) => _then(v as _KanjiState));

  @override
  _KanjiState get _value => super._value as _KanjiState;

  @override
  $Res call({
    Object? lstTableServingProgress = freezed,
    Object? selectedCardIndex = freezed,
    Object? jlptLevel = freezed,
  }) {
    return _then(_KanjiState(
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
class _$_KanjiState implements _KanjiState {
  const _$_KanjiState(
      {this.lstTableServingProgress = const [],
      this.selectedCardIndex = 1,
      this.jlptLevel = 1});

  factory _$_KanjiState.fromJson(Map<String, dynamic> json) =>
      _$$_KanjiStateFromJson(json);

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
    return 'KanjiState(lstTableServingProgress: $lstTableServingProgress, selectedCardIndex: $selectedCardIndex, jlptLevel: $jlptLevel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _KanjiState &&
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
  _$KanjiStateCopyWith<_KanjiState> get copyWith =>
      __$KanjiStateCopyWithImpl<_KanjiState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_KanjiStateToJson(this);
  }
}

abstract class _KanjiState implements KanjiState {
  const factory _KanjiState(
      {List<dynamic> lstTableServingProgress,
      int selectedCardIndex,
      int jlptLevel}) = _$_KanjiState;

  factory _KanjiState.fromJson(Map<String, dynamic> json) =
      _$_KanjiState.fromJson;

  @override
  List<dynamic> get lstTableServingProgress =>
      throw _privateConstructorUsedError;
  @override
  int get selectedCardIndex => throw _privateConstructorUsedError;
  @override
  int get jlptLevel => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$KanjiStateCopyWith<_KanjiState> get copyWith =>
      throw _privateConstructorUsedError;
}
