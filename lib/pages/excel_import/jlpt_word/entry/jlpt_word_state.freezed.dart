// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'jlpt_word_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

JlptWordState _$JlptWordStateFromJson(Map<String, dynamic> json) {
  return _JlptWordState.fromJson(json);
}

/// @nodoc
class _$JlptWordStateTearOff {
  const _$JlptWordStateTearOff();

  _JlptWordState call(
      {List<dynamic> lstTableServingProgress = const [],
      int selectedCardIndex = 1,
      int jlptLevel = 1,
      dynamic selectedExerciseData = null}) {
    return _JlptWordState(
      lstTableServingProgress: lstTableServingProgress,
      selectedCardIndex: selectedCardIndex,
      jlptLevel: jlptLevel,
      selectedExerciseData: selectedExerciseData,
    );
  }

  JlptWordState fromJson(Map<String, Object> json) {
    return JlptWordState.fromJson(json);
  }
}

/// @nodoc
const $JlptWordState = _$JlptWordStateTearOff();

/// @nodoc
mixin _$JlptWordState {
  List<dynamic> get lstTableServingProgress =>
      throw _privateConstructorUsedError;
  int get selectedCardIndex => throw _privateConstructorUsedError;
  int get jlptLevel => throw _privateConstructorUsedError;
  dynamic get selectedExerciseData => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $JlptWordStateCopyWith<JlptWordState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JlptWordStateCopyWith<$Res> {
  factory $JlptWordStateCopyWith(
          JlptWordState value, $Res Function(JlptWordState) then) =
      _$JlptWordStateCopyWithImpl<$Res>;
  $Res call(
      {List<dynamic> lstTableServingProgress,
      int selectedCardIndex,
      int jlptLevel,
      dynamic selectedExerciseData});
}

/// @nodoc
class _$JlptWordStateCopyWithImpl<$Res>
    implements $JlptWordStateCopyWith<$Res> {
  _$JlptWordStateCopyWithImpl(this._value, this._then);

  final JlptWordState _value;
  // ignore: unused_field
  final $Res Function(JlptWordState) _then;

  @override
  $Res call({
    Object? lstTableServingProgress = freezed,
    Object? selectedCardIndex = freezed,
    Object? jlptLevel = freezed,
    Object? selectedExerciseData = freezed,
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
      selectedExerciseData: selectedExerciseData == freezed
          ? _value.selectedExerciseData
          : selectedExerciseData // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
abstract class _$JlptWordStateCopyWith<$Res>
    implements $JlptWordStateCopyWith<$Res> {
  factory _$JlptWordStateCopyWith(
          _JlptWordState value, $Res Function(_JlptWordState) then) =
      __$JlptWordStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<dynamic> lstTableServingProgress,
      int selectedCardIndex,
      int jlptLevel,
      dynamic selectedExerciseData});
}

/// @nodoc
class __$JlptWordStateCopyWithImpl<$Res>
    extends _$JlptWordStateCopyWithImpl<$Res>
    implements _$JlptWordStateCopyWith<$Res> {
  __$JlptWordStateCopyWithImpl(
      _JlptWordState _value, $Res Function(_JlptWordState) _then)
      : super(_value, (v) => _then(v as _JlptWordState));

  @override
  _JlptWordState get _value => super._value as _JlptWordState;

  @override
  $Res call({
    Object? lstTableServingProgress = freezed,
    Object? selectedCardIndex = freezed,
    Object? jlptLevel = freezed,
    Object? selectedExerciseData = freezed,
  }) {
    return _then(_JlptWordState(
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
      selectedExerciseData: selectedExerciseData == freezed
          ? _value.selectedExerciseData
          : selectedExerciseData // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_JlptWordState implements _JlptWordState {
  const _$_JlptWordState(
      {this.lstTableServingProgress = const [],
      this.selectedCardIndex = 1,
      this.jlptLevel = 1,
      this.selectedExerciseData = null});

  factory _$_JlptWordState.fromJson(Map<String, dynamic> json) =>
      _$$_JlptWordStateFromJson(json);

  @JsonKey(defaultValue: const [])
  @override
  final List<dynamic> lstTableServingProgress;
  @JsonKey(defaultValue: 1)
  @override
  final int selectedCardIndex;
  @JsonKey(defaultValue: 1)
  @override
  final int jlptLevel;
  @JsonKey(defaultValue: null)
  @override
  final dynamic selectedExerciseData;

  @override
  String toString() {
    return 'JlptWordState(lstTableServingProgress: $lstTableServingProgress, selectedCardIndex: $selectedCardIndex, jlptLevel: $jlptLevel, selectedExerciseData: $selectedExerciseData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _JlptWordState &&
            (identical(
                    other.lstTableServingProgress, lstTableServingProgress) ||
                const DeepCollectionEquality().equals(
                    other.lstTableServingProgress, lstTableServingProgress)) &&
            (identical(other.selectedCardIndex, selectedCardIndex) ||
                const DeepCollectionEquality()
                    .equals(other.selectedCardIndex, selectedCardIndex)) &&
            (identical(other.jlptLevel, jlptLevel) ||
                const DeepCollectionEquality()
                    .equals(other.jlptLevel, jlptLevel)) &&
            (identical(other.selectedExerciseData, selectedExerciseData) ||
                const DeepCollectionEquality()
                    .equals(other.selectedExerciseData, selectedExerciseData)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(lstTableServingProgress) ^
      const DeepCollectionEquality().hash(selectedCardIndex) ^
      const DeepCollectionEquality().hash(jlptLevel) ^
      const DeepCollectionEquality().hash(selectedExerciseData);

  @JsonKey(ignore: true)
  @override
  _$JlptWordStateCopyWith<_JlptWordState> get copyWith =>
      __$JlptWordStateCopyWithImpl<_JlptWordState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_JlptWordStateToJson(this);
  }
}

abstract class _JlptWordState implements JlptWordState {
  const factory _JlptWordState(
      {List<dynamic> lstTableServingProgress,
      int selectedCardIndex,
      int jlptLevel,
      dynamic selectedExerciseData}) = _$_JlptWordState;

  factory _JlptWordState.fromJson(Map<String, dynamic> json) =
      _$_JlptWordState.fromJson;

  @override
  List<dynamic> get lstTableServingProgress =>
      throw _privateConstructorUsedError;
  @override
  int get selectedCardIndex => throw _privateConstructorUsedError;
  @override
  int get jlptLevel => throw _privateConstructorUsedError;
  @override
  dynamic get selectedExerciseData => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$JlptWordStateCopyWith<_JlptWordState> get copyWith =>
      throw _privateConstructorUsedError;
}
