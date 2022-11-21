// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'listening_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ListeningState _$ListeningStateFromJson(Map<String, dynamic> json) {
  return _ListeningState.fromJson(json);
}

/// @nodoc
class _$ListeningStateTearOff {
  const _$ListeningStateTearOff();

  _ListeningState call(
      {List<dynamic> lstTableServingProgress = const [],
      int selectedCardIndex = 1,
      dynamic selectedExerciseData = null,
      int jlptLevel = 1}) {
    return _ListeningState(
      lstTableServingProgress: lstTableServingProgress,
      selectedCardIndex: selectedCardIndex,
      selectedExerciseData: selectedExerciseData,
      jlptLevel: jlptLevel,
    );
  }

  ListeningState fromJson(Map<String, Object> json) {
    return ListeningState.fromJson(json);
  }
}

/// @nodoc
const $ListeningState = _$ListeningStateTearOff();

/// @nodoc
mixin _$ListeningState {
  List<dynamic> get lstTableServingProgress =>
      throw _privateConstructorUsedError;
  int get selectedCardIndex => throw _privateConstructorUsedError;
  dynamic get selectedExerciseData => throw _privateConstructorUsedError;
  int get jlptLevel => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ListeningStateCopyWith<ListeningState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListeningStateCopyWith<$Res> {
  factory $ListeningStateCopyWith(
          ListeningState value, $Res Function(ListeningState) then) =
      _$ListeningStateCopyWithImpl<$Res>;
  $Res call(
      {List<dynamic> lstTableServingProgress,
      int selectedCardIndex,
      dynamic selectedExerciseData,
      int jlptLevel});
}

/// @nodoc
class _$ListeningStateCopyWithImpl<$Res>
    implements $ListeningStateCopyWith<$Res> {
  _$ListeningStateCopyWithImpl(this._value, this._then);

  final ListeningState _value;
  // ignore: unused_field
  final $Res Function(ListeningState) _then;

  @override
  $Res call({
    Object? lstTableServingProgress = freezed,
    Object? selectedCardIndex = freezed,
    Object? selectedExerciseData = freezed,
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
      selectedExerciseData: selectedExerciseData == freezed
          ? _value.selectedExerciseData
          : selectedExerciseData // ignore: cast_nullable_to_non_nullable
              as dynamic,
      jlptLevel: jlptLevel == freezed
          ? _value.jlptLevel
          : jlptLevel // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$ListeningStateCopyWith<$Res>
    implements $ListeningStateCopyWith<$Res> {
  factory _$ListeningStateCopyWith(
          _ListeningState value, $Res Function(_ListeningState) then) =
      __$ListeningStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<dynamic> lstTableServingProgress,
      int selectedCardIndex,
      dynamic selectedExerciseData,
      int jlptLevel});
}

/// @nodoc
class __$ListeningStateCopyWithImpl<$Res>
    extends _$ListeningStateCopyWithImpl<$Res>
    implements _$ListeningStateCopyWith<$Res> {
  __$ListeningStateCopyWithImpl(
      _ListeningState _value, $Res Function(_ListeningState) _then)
      : super(_value, (v) => _then(v as _ListeningState));

  @override
  _ListeningState get _value => super._value as _ListeningState;

  @override
  $Res call({
    Object? lstTableServingProgress = freezed,
    Object? selectedCardIndex = freezed,
    Object? selectedExerciseData = freezed,
    Object? jlptLevel = freezed,
  }) {
    return _then(_ListeningState(
      lstTableServingProgress: lstTableServingProgress == freezed
          ? _value.lstTableServingProgress
          : lstTableServingProgress // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      selectedCardIndex: selectedCardIndex == freezed
          ? _value.selectedCardIndex
          : selectedCardIndex // ignore: cast_nullable_to_non_nullable
              as int,
      selectedExerciseData: selectedExerciseData == freezed
          ? _value.selectedExerciseData
          : selectedExerciseData // ignore: cast_nullable_to_non_nullable
              as dynamic,
      jlptLevel: jlptLevel == freezed
          ? _value.jlptLevel
          : jlptLevel // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ListeningState implements _ListeningState {
  const _$_ListeningState(
      {this.lstTableServingProgress = const [],
      this.selectedCardIndex = 1,
      this.selectedExerciseData = null,
      this.jlptLevel = 1});

  factory _$_ListeningState.fromJson(Map<String, dynamic> json) =>
      _$$_ListeningStateFromJson(json);

  @JsonKey(defaultValue: const [])
  @override
  final List<dynamic> lstTableServingProgress;
  @JsonKey(defaultValue: 1)
  @override
  final int selectedCardIndex;
  @JsonKey(defaultValue: null)
  @override
  final dynamic selectedExerciseData;
  @JsonKey(defaultValue: 1)
  @override
  final int jlptLevel;

  @override
  String toString() {
    return 'ListeningState(lstTableServingProgress: $lstTableServingProgress, selectedCardIndex: $selectedCardIndex, selectedExerciseData: $selectedExerciseData, jlptLevel: $jlptLevel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ListeningState &&
            (identical(
                    other.lstTableServingProgress, lstTableServingProgress) ||
                const DeepCollectionEquality().equals(
                    other.lstTableServingProgress, lstTableServingProgress)) &&
            (identical(other.selectedCardIndex, selectedCardIndex) ||
                const DeepCollectionEquality()
                    .equals(other.selectedCardIndex, selectedCardIndex)) &&
            (identical(other.selectedExerciseData, selectedExerciseData) ||
                const DeepCollectionEquality().equals(
                    other.selectedExerciseData, selectedExerciseData)) &&
            (identical(other.jlptLevel, jlptLevel) ||
                const DeepCollectionEquality()
                    .equals(other.jlptLevel, jlptLevel)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(lstTableServingProgress) ^
      const DeepCollectionEquality().hash(selectedCardIndex) ^
      const DeepCollectionEquality().hash(selectedExerciseData) ^
      const DeepCollectionEquality().hash(jlptLevel);

  @JsonKey(ignore: true)
  @override
  _$ListeningStateCopyWith<_ListeningState> get copyWith =>
      __$ListeningStateCopyWithImpl<_ListeningState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ListeningStateToJson(this);
  }
}

abstract class _ListeningState implements ListeningState {
  const factory _ListeningState(
      {List<dynamic> lstTableServingProgress,
      int selectedCardIndex,
      dynamic selectedExerciseData,
      int jlptLevel}) = _$_ListeningState;

  factory _ListeningState.fromJson(Map<String, dynamic> json) =
      _$_ListeningState.fromJson;

  @override
  List<dynamic> get lstTableServingProgress =>
      throw _privateConstructorUsedError;
  @override
  int get selectedCardIndex => throw _privateConstructorUsedError;
  @override
  dynamic get selectedExerciseData => throw _privateConstructorUsedError;
  @override
  int get jlptLevel => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ListeningStateCopyWith<_ListeningState> get copyWith =>
      throw _privateConstructorUsedError;
}
