// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'vocabulary_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

VocabularyState _$VocabularyStateFromJson(Map<String, dynamic> json) {
  return _VocabularyState.fromJson(json);
}

/// @nodoc
class _$VocabularyStateTearOff {
  const _$VocabularyStateTearOff();

  _VocabularyState call(
      {List<dynamic> lstTableServingProgress = const [],
      int selectedCardIndex = 1,
      int jlptLevel = 1,
      dynamic selectedExerciseData = null}) {
    return _VocabularyState(
      lstTableServingProgress: lstTableServingProgress,
      selectedCardIndex: selectedCardIndex,
      jlptLevel: jlptLevel,
      selectedExerciseData: selectedExerciseData,
    );
  }

  VocabularyState fromJson(Map<String, Object> json) {
    return VocabularyState.fromJson(json);
  }
}

/// @nodoc
const $VocabularyState = _$VocabularyStateTearOff();

/// @nodoc
mixin _$VocabularyState {
  List<dynamic> get lstTableServingProgress =>
      throw _privateConstructorUsedError;
  int get selectedCardIndex => throw _privateConstructorUsedError;
  int get jlptLevel => throw _privateConstructorUsedError;
  dynamic get selectedExerciseData => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VocabularyStateCopyWith<VocabularyState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VocabularyStateCopyWith<$Res> {
  factory $VocabularyStateCopyWith(
          VocabularyState value, $Res Function(VocabularyState) then) =
      _$VocabularyStateCopyWithImpl<$Res>;
  $Res call(
      {List<dynamic> lstTableServingProgress,
      int selectedCardIndex,
      int jlptLevel,
      dynamic selectedExerciseData});
}

/// @nodoc
class _$VocabularyStateCopyWithImpl<$Res>
    implements $VocabularyStateCopyWith<$Res> {
  _$VocabularyStateCopyWithImpl(this._value, this._then);

  final VocabularyState _value;
  // ignore: unused_field
  final $Res Function(VocabularyState) _then;

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
abstract class _$VocabularyStateCopyWith<$Res>
    implements $VocabularyStateCopyWith<$Res> {
  factory _$VocabularyStateCopyWith(
          _VocabularyState value, $Res Function(_VocabularyState) then) =
      __$VocabularyStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<dynamic> lstTableServingProgress,
      int selectedCardIndex,
      int jlptLevel,
      dynamic selectedExerciseData});
}

/// @nodoc
class __$VocabularyStateCopyWithImpl<$Res>
    extends _$VocabularyStateCopyWithImpl<$Res>
    implements _$VocabularyStateCopyWith<$Res> {
  __$VocabularyStateCopyWithImpl(
      _VocabularyState _value, $Res Function(_VocabularyState) _then)
      : super(_value, (v) => _then(v as _VocabularyState));

  @override
  _VocabularyState get _value => super._value as _VocabularyState;

  @override
  $Res call({
    Object? lstTableServingProgress = freezed,
    Object? selectedCardIndex = freezed,
    Object? jlptLevel = freezed,
    Object? selectedExerciseData = freezed,
  }) {
    return _then(_VocabularyState(
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
class _$_VocabularyState implements _VocabularyState {
  const _$_VocabularyState(
      {this.lstTableServingProgress = const [],
      this.selectedCardIndex = 1,
      this.jlptLevel = 1,
      this.selectedExerciseData = null});

  factory _$_VocabularyState.fromJson(Map<String, dynamic> json) =>
      _$$_VocabularyStateFromJson(json);

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
    return 'VocabularyState(lstTableServingProgress: $lstTableServingProgress, selectedCardIndex: $selectedCardIndex, jlptLevel: $jlptLevel, selectedExerciseData: $selectedExerciseData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _VocabularyState &&
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
  _$VocabularyStateCopyWith<_VocabularyState> get copyWith =>
      __$VocabularyStateCopyWithImpl<_VocabularyState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_VocabularyStateToJson(this);
  }
}

abstract class _VocabularyState implements VocabularyState {
  const factory _VocabularyState(
      {List<dynamic> lstTableServingProgress,
      int selectedCardIndex,
      int jlptLevel,
      dynamic selectedExerciseData}) = _$_VocabularyState;

  factory _VocabularyState.fromJson(Map<String, dynamic> json) =
      _$_VocabularyState.fromJson;

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
  _$VocabularyStateCopyWith<_VocabularyState> get copyWith =>
      throw _privateConstructorUsedError;
}
