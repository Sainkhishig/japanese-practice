// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'grammar_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GrammarState _$GrammarStateFromJson(Map<String, dynamic> json) {
  return _GrammarState.fromJson(json);
}

/// @nodoc
class _$GrammarStateTearOff {
  const _$GrammarStateTearOff();

  _GrammarState call(
      {List<dynamic> lstGrammar = const [],
      int selectedCardIndex = 1,
      dynamic selectedExerciseData = null,
      int jlptLevel = 1}) {
    return _GrammarState(
      lstGrammar: lstGrammar,
      selectedCardIndex: selectedCardIndex,
      selectedExerciseData: selectedExerciseData,
      jlptLevel: jlptLevel,
    );
  }

  GrammarState fromJson(Map<String, Object> json) {
    return GrammarState.fromJson(json);
  }
}

/// @nodoc
const $GrammarState = _$GrammarStateTearOff();

/// @nodoc
mixin _$GrammarState {
  List<dynamic> get lstGrammar => throw _privateConstructorUsedError;
  int get selectedCardIndex => throw _privateConstructorUsedError;
  dynamic get selectedExerciseData => throw _privateConstructorUsedError;
  int get jlptLevel => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GrammarStateCopyWith<GrammarState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GrammarStateCopyWith<$Res> {
  factory $GrammarStateCopyWith(
          GrammarState value, $Res Function(GrammarState) then) =
      _$GrammarStateCopyWithImpl<$Res>;
  $Res call(
      {List<dynamic> lstGrammar,
      int selectedCardIndex,
      dynamic selectedExerciseData,
      int jlptLevel});
}

/// @nodoc
class _$GrammarStateCopyWithImpl<$Res> implements $GrammarStateCopyWith<$Res> {
  _$GrammarStateCopyWithImpl(this._value, this._then);

  final GrammarState _value;
  // ignore: unused_field
  final $Res Function(GrammarState) _then;

  @override
  $Res call({
    Object? lstGrammar = freezed,
    Object? selectedCardIndex = freezed,
    Object? selectedExerciseData = freezed,
    Object? jlptLevel = freezed,
  }) {
    return _then(_value.copyWith(
      lstGrammar: lstGrammar == freezed
          ? _value.lstGrammar
          : lstGrammar // ignore: cast_nullable_to_non_nullable
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
abstract class _$GrammarStateCopyWith<$Res>
    implements $GrammarStateCopyWith<$Res> {
  factory _$GrammarStateCopyWith(
          _GrammarState value, $Res Function(_GrammarState) then) =
      __$GrammarStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<dynamic> lstGrammar,
      int selectedCardIndex,
      dynamic selectedExerciseData,
      int jlptLevel});
}

/// @nodoc
class __$GrammarStateCopyWithImpl<$Res> extends _$GrammarStateCopyWithImpl<$Res>
    implements _$GrammarStateCopyWith<$Res> {
  __$GrammarStateCopyWithImpl(
      _GrammarState _value, $Res Function(_GrammarState) _then)
      : super(_value, (v) => _then(v as _GrammarState));

  @override
  _GrammarState get _value => super._value as _GrammarState;

  @override
  $Res call({
    Object? lstGrammar = freezed,
    Object? selectedCardIndex = freezed,
    Object? selectedExerciseData = freezed,
    Object? jlptLevel = freezed,
  }) {
    return _then(_GrammarState(
      lstGrammar: lstGrammar == freezed
          ? _value.lstGrammar
          : lstGrammar // ignore: cast_nullable_to_non_nullable
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
class _$_GrammarState implements _GrammarState {
  const _$_GrammarState(
      {this.lstGrammar = const [],
      this.selectedCardIndex = 1,
      this.selectedExerciseData = null,
      this.jlptLevel = 1});

  factory _$_GrammarState.fromJson(Map<String, dynamic> json) =>
      _$$_GrammarStateFromJson(json);

  @JsonKey(defaultValue: const [])
  @override
  final List<dynamic> lstGrammar;
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
    return 'GrammarState(lstGrammar: $lstGrammar, selectedCardIndex: $selectedCardIndex, selectedExerciseData: $selectedExerciseData, jlptLevel: $jlptLevel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _GrammarState &&
            (identical(other.lstGrammar, lstGrammar) ||
                const DeepCollectionEquality()
                    .equals(other.lstGrammar, lstGrammar)) &&
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
      const DeepCollectionEquality().hash(lstGrammar) ^
      const DeepCollectionEquality().hash(selectedCardIndex) ^
      const DeepCollectionEquality().hash(selectedExerciseData) ^
      const DeepCollectionEquality().hash(jlptLevel);

  @JsonKey(ignore: true)
  @override
  _$GrammarStateCopyWith<_GrammarState> get copyWith =>
      __$GrammarStateCopyWithImpl<_GrammarState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GrammarStateToJson(this);
  }
}

abstract class _GrammarState implements GrammarState {
  const factory _GrammarState(
      {List<dynamic> lstGrammar,
      int selectedCardIndex,
      dynamic selectedExerciseData,
      int jlptLevel}) = _$_GrammarState;

  factory _GrammarState.fromJson(Map<String, dynamic> json) =
      _$_GrammarState.fromJson;

  @override
  List<dynamic> get lstGrammar => throw _privateConstructorUsedError;
  @override
  int get selectedCardIndex => throw _privateConstructorUsedError;
  @override
  dynamic get selectedExerciseData => throw _privateConstructorUsedError;
  @override
  int get jlptLevel => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$GrammarStateCopyWith<_GrammarState> get copyWith =>
      throw _privateConstructorUsedError;
}
