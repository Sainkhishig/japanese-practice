// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'common_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CommonPageModel _$CommonPageModelFromJson(Map<String, dynamic> json) {
  return _CommonPageModel.fromJson(json);
}

/// @nodoc
class _$CommonPageModelTearOff {
  const _$CommonPageModelTearOff();

  _CommonPageModel call(
      {String title = "",
      int selectedIndex = 0,
      bool isGameMode = false,
      String masterDataDestination = "masterDate"}) {
    return _CommonPageModel(
      title: title,
      selectedIndex: selectedIndex,
      isGameMode: isGameMode,
      masterDataDestination: masterDataDestination,
    );
  }

  CommonPageModel fromJson(Map<String, Object> json) {
    return CommonPageModel.fromJson(json);
  }
}

/// @nodoc
const $CommonPageModel = _$CommonPageModelTearOff();

/// @nodoc
mixin _$CommonPageModel {
  String get title => throw _privateConstructorUsedError;
  int get selectedIndex => throw _privateConstructorUsedError;
  bool get isGameMode => throw _privateConstructorUsedError;
  String get masterDataDestination => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommonPageModelCopyWith<CommonPageModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommonPageModelCopyWith<$Res> {
  factory $CommonPageModelCopyWith(
          CommonPageModel value, $Res Function(CommonPageModel) then) =
      _$CommonPageModelCopyWithImpl<$Res>;
  $Res call(
      {String title,
      int selectedIndex,
      bool isGameMode,
      String masterDataDestination});
}

/// @nodoc
class _$CommonPageModelCopyWithImpl<$Res>
    implements $CommonPageModelCopyWith<$Res> {
  _$CommonPageModelCopyWithImpl(this._value, this._then);

  final CommonPageModel _value;
  // ignore: unused_field
  final $Res Function(CommonPageModel) _then;

  @override
  $Res call({
    Object? title = freezed,
    Object? selectedIndex = freezed,
    Object? isGameMode = freezed,
    Object? masterDataDestination = freezed,
  }) {
    return _then(_value.copyWith(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      selectedIndex: selectedIndex == freezed
          ? _value.selectedIndex
          : selectedIndex // ignore: cast_nullable_to_non_nullable
              as int,
      isGameMode: isGameMode == freezed
          ? _value.isGameMode
          : isGameMode // ignore: cast_nullable_to_non_nullable
              as bool,
      masterDataDestination: masterDataDestination == freezed
          ? _value.masterDataDestination
          : masterDataDestination // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$CommonPageModelCopyWith<$Res>
    implements $CommonPageModelCopyWith<$Res> {
  factory _$CommonPageModelCopyWith(
          _CommonPageModel value, $Res Function(_CommonPageModel) then) =
      __$CommonPageModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String title,
      int selectedIndex,
      bool isGameMode,
      String masterDataDestination});
}

/// @nodoc
class __$CommonPageModelCopyWithImpl<$Res>
    extends _$CommonPageModelCopyWithImpl<$Res>
    implements _$CommonPageModelCopyWith<$Res> {
  __$CommonPageModelCopyWithImpl(
      _CommonPageModel _value, $Res Function(_CommonPageModel) _then)
      : super(_value, (v) => _then(v as _CommonPageModel));

  @override
  _CommonPageModel get _value => super._value as _CommonPageModel;

  @override
  $Res call({
    Object? title = freezed,
    Object? selectedIndex = freezed,
    Object? isGameMode = freezed,
    Object? masterDataDestination = freezed,
  }) {
    return _then(_CommonPageModel(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      selectedIndex: selectedIndex == freezed
          ? _value.selectedIndex
          : selectedIndex // ignore: cast_nullable_to_non_nullable
              as int,
      isGameMode: isGameMode == freezed
          ? _value.isGameMode
          : isGameMode // ignore: cast_nullable_to_non_nullable
              as bool,
      masterDataDestination: masterDataDestination == freezed
          ? _value.masterDataDestination
          : masterDataDestination // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CommonPageModel implements _CommonPageModel {
  const _$_CommonPageModel(
      {this.title = "",
      this.selectedIndex = 0,
      this.isGameMode = false,
      this.masterDataDestination = "masterDate"});

  factory _$_CommonPageModel.fromJson(Map<String, dynamic> json) =>
      _$$_CommonPageModelFromJson(json);

  @JsonKey(defaultValue: "")
  @override
  final String title;
  @JsonKey(defaultValue: 0)
  @override
  final int selectedIndex;
  @JsonKey(defaultValue: false)
  @override
  final bool isGameMode;
  @JsonKey(defaultValue: "masterDate")
  @override
  final String masterDataDestination;

  @override
  String toString() {
    return 'CommonPageModel(title: $title, selectedIndex: $selectedIndex, isGameMode: $isGameMode, masterDataDestination: $masterDataDestination)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CommonPageModel &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.selectedIndex, selectedIndex) ||
                const DeepCollectionEquality()
                    .equals(other.selectedIndex, selectedIndex)) &&
            (identical(other.isGameMode, isGameMode) ||
                const DeepCollectionEquality()
                    .equals(other.isGameMode, isGameMode)) &&
            (identical(other.masterDataDestination, masterDataDestination) ||
                const DeepCollectionEquality().equals(
                    other.masterDataDestination, masterDataDestination)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(selectedIndex) ^
      const DeepCollectionEquality().hash(isGameMode) ^
      const DeepCollectionEquality().hash(masterDataDestination);

  @JsonKey(ignore: true)
  @override
  _$CommonPageModelCopyWith<_CommonPageModel> get copyWith =>
      __$CommonPageModelCopyWithImpl<_CommonPageModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CommonPageModelToJson(this);
  }
}

abstract class _CommonPageModel implements CommonPageModel {
  const factory _CommonPageModel(
      {String title,
      int selectedIndex,
      bool isGameMode,
      String masterDataDestination}) = _$_CommonPageModel;

  factory _CommonPageModel.fromJson(Map<String, dynamic> json) =
      _$_CommonPageModel.fromJson;

  @override
  String get title => throw _privateConstructorUsedError;
  @override
  int get selectedIndex => throw _privateConstructorUsedError;
  @override
  bool get isGameMode => throw _privateConstructorUsedError;
  @override
  String get masterDataDestination => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$CommonPageModelCopyWith<_CommonPageModel> get copyWith =>
      throw _privateConstructorUsedError;
}
