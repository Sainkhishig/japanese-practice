// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'jlpt_word_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

JlptWordListState _$JlptWordListStateFromJson(Map<String, dynamic> json) {
  return _JlptWordListState.fromJson(json);
}

/// @nodoc
class _$JlptWordListStateTearOff {
  const _$JlptWordListStateTearOff();

  _JlptWordListState call(
      {List<dynamic> lstTableServingProgress = const [],
      int selectedCardIndex = 1,
      dynamic selectedRowData = null,
      int jlptLevel = 1}) {
    return _JlptWordListState(
      lstTableServingProgress: lstTableServingProgress,
      selectedCardIndex: selectedCardIndex,
      selectedRowData: selectedRowData,
      jlptLevel: jlptLevel,
    );
  }

  JlptWordListState fromJson(Map<String, Object> json) {
    return JlptWordListState.fromJson(json);
  }
}

/// @nodoc
const $JlptWordListState = _$JlptWordListStateTearOff();

/// @nodoc
mixin _$JlptWordListState {
  List<dynamic> get lstTableServingProgress =>
      throw _privateConstructorUsedError;
  int get selectedCardIndex => throw _privateConstructorUsedError;
  dynamic get selectedRowData => throw _privateConstructorUsedError;
  int get jlptLevel => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $JlptWordListStateCopyWith<JlptWordListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JlptWordListStateCopyWith<$Res> {
  factory $JlptWordListStateCopyWith(
          JlptWordListState value, $Res Function(JlptWordListState) then) =
      _$JlptWordListStateCopyWithImpl<$Res>;
  $Res call(
      {List<dynamic> lstTableServingProgress,
      int selectedCardIndex,
      dynamic selectedRowData,
      int jlptLevel});
}

/// @nodoc
class _$JlptWordListStateCopyWithImpl<$Res>
    implements $JlptWordListStateCopyWith<$Res> {
  _$JlptWordListStateCopyWithImpl(this._value, this._then);

  final JlptWordListState _value;
  // ignore: unused_field
  final $Res Function(JlptWordListState) _then;

  @override
  $Res call({
    Object? lstTableServingProgress = freezed,
    Object? selectedCardIndex = freezed,
    Object? selectedRowData = freezed,
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
      selectedRowData: selectedRowData == freezed
          ? _value.selectedRowData
          : selectedRowData // ignore: cast_nullable_to_non_nullable
              as dynamic,
      jlptLevel: jlptLevel == freezed
          ? _value.jlptLevel
          : jlptLevel // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$JlptWordListStateCopyWith<$Res>
    implements $JlptWordListStateCopyWith<$Res> {
  factory _$JlptWordListStateCopyWith(
          _JlptWordListState value, $Res Function(_JlptWordListState) then) =
      __$JlptWordListStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<dynamic> lstTableServingProgress,
      int selectedCardIndex,
      dynamic selectedRowData,
      int jlptLevel});
}

/// @nodoc
class __$JlptWordListStateCopyWithImpl<$Res>
    extends _$JlptWordListStateCopyWithImpl<$Res>
    implements _$JlptWordListStateCopyWith<$Res> {
  __$JlptWordListStateCopyWithImpl(
      _JlptWordListState _value, $Res Function(_JlptWordListState) _then)
      : super(_value, (v) => _then(v as _JlptWordListState));

  @override
  _JlptWordListState get _value => super._value as _JlptWordListState;

  @override
  $Res call({
    Object? lstTableServingProgress = freezed,
    Object? selectedCardIndex = freezed,
    Object? selectedRowData = freezed,
    Object? jlptLevel = freezed,
  }) {
    return _then(_JlptWordListState(
      lstTableServingProgress: lstTableServingProgress == freezed
          ? _value.lstTableServingProgress
          : lstTableServingProgress // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      selectedCardIndex: selectedCardIndex == freezed
          ? _value.selectedCardIndex
          : selectedCardIndex // ignore: cast_nullable_to_non_nullable
              as int,
      selectedRowData: selectedRowData == freezed
          ? _value.selectedRowData
          : selectedRowData // ignore: cast_nullable_to_non_nullable
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
class _$_JlptWordListState implements _JlptWordListState {
  const _$_JlptWordListState(
      {this.lstTableServingProgress = const [],
      this.selectedCardIndex = 1,
      this.selectedRowData = null,
      this.jlptLevel = 1});

  factory _$_JlptWordListState.fromJson(Map<String, dynamic> json) =>
      _$$_JlptWordListStateFromJson(json);

  @JsonKey(defaultValue: const [])
  @override
  final List<dynamic> lstTableServingProgress;
  @JsonKey(defaultValue: 1)
  @override
  final int selectedCardIndex;
  @JsonKey(defaultValue: null)
  @override
  final dynamic selectedRowData;
  @JsonKey(defaultValue: 1)
  @override
  final int jlptLevel;

  @override
  String toString() {
    return 'JlptWordListState(lstTableServingProgress: $lstTableServingProgress, selectedCardIndex: $selectedCardIndex, selectedRowData: $selectedRowData, jlptLevel: $jlptLevel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _JlptWordListState &&
            (identical(
                    other.lstTableServingProgress, lstTableServingProgress) ||
                const DeepCollectionEquality().equals(
                    other.lstTableServingProgress, lstTableServingProgress)) &&
            (identical(other.selectedCardIndex, selectedCardIndex) ||
                const DeepCollectionEquality()
                    .equals(other.selectedCardIndex, selectedCardIndex)) &&
            (identical(other.selectedRowData, selectedRowData) ||
                const DeepCollectionEquality()
                    .equals(other.selectedRowData, selectedRowData)) &&
            (identical(other.jlptLevel, jlptLevel) ||
                const DeepCollectionEquality()
                    .equals(other.jlptLevel, jlptLevel)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(lstTableServingProgress) ^
      const DeepCollectionEquality().hash(selectedCardIndex) ^
      const DeepCollectionEquality().hash(selectedRowData) ^
      const DeepCollectionEquality().hash(jlptLevel);

  @JsonKey(ignore: true)
  @override
  _$JlptWordListStateCopyWith<_JlptWordListState> get copyWith =>
      __$JlptWordListStateCopyWithImpl<_JlptWordListState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_JlptWordListStateToJson(this);
  }
}

abstract class _JlptWordListState implements JlptWordListState {
  const factory _JlptWordListState(
      {List<dynamic> lstTableServingProgress,
      int selectedCardIndex,
      dynamic selectedRowData,
      int jlptLevel}) = _$_JlptWordListState;

  factory _JlptWordListState.fromJson(Map<String, dynamic> json) =
      _$_JlptWordListState.fromJson;

  @override
  List<dynamic> get lstTableServingProgress =>
      throw _privateConstructorUsedError;
  @override
  int get selectedCardIndex => throw _privateConstructorUsedError;
  @override
  dynamic get selectedRowData => throw _privateConstructorUsedError;
  @override
  int get jlptLevel => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$JlptWordListStateCopyWith<_JlptWordListState> get copyWith =>
      throw _privateConstructorUsedError;
}
