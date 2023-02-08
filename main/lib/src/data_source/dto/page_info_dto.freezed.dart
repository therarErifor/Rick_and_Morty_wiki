// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'page_info_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PageInfoDto _$PageInfoDtoFromJson(Map<String, dynamic> json) {
  return _PageInfoDto.fromJson(json);
}

/// @nodoc
mixin _$PageInfoDto {
  List<InfoDto> get info => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PageInfoDtoCopyWith<PageInfoDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PageInfoDtoCopyWith<$Res> {
  factory $PageInfoDtoCopyWith(
          PageInfoDto value, $Res Function(PageInfoDto) then) =
      _$PageInfoDtoCopyWithImpl<$Res, PageInfoDto>;
  @useResult
  $Res call({List<InfoDto> info});
}

/// @nodoc
class _$PageInfoDtoCopyWithImpl<$Res, $Val extends PageInfoDto>
    implements $PageInfoDtoCopyWith<$Res> {
  _$PageInfoDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? info = null,
  }) {
    return _then(_value.copyWith(
      info: null == info
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as List<InfoDto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PageInfoDtoCopyWith<$Res>
    implements $PageInfoDtoCopyWith<$Res> {
  factory _$$_PageInfoDtoCopyWith(
          _$_PageInfoDto value, $Res Function(_$_PageInfoDto) then) =
      __$$_PageInfoDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<InfoDto> info});
}

/// @nodoc
class __$$_PageInfoDtoCopyWithImpl<$Res>
    extends _$PageInfoDtoCopyWithImpl<$Res, _$_PageInfoDto>
    implements _$$_PageInfoDtoCopyWith<$Res> {
  __$$_PageInfoDtoCopyWithImpl(
      _$_PageInfoDto _value, $Res Function(_$_PageInfoDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? info = null,
  }) {
    return _then(_$_PageInfoDto(
      info: null == info
          ? _value._info
          : info // ignore: cast_nullable_to_non_nullable
              as List<InfoDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PageInfoDto implements _PageInfoDto {
  const _$_PageInfoDto({required final List<InfoDto> info}) : _info = info;

  factory _$_PageInfoDto.fromJson(Map<String, dynamic> json) =>
      _$$_PageInfoDtoFromJson(json);

  final List<InfoDto> _info;
  @override
  List<InfoDto> get info {
    if (_info is EqualUnmodifiableListView) return _info;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_info);
  }

  @override
  String toString() {
    return 'PageInfoDto(info: $info)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PageInfoDto &&
            const DeepCollectionEquality().equals(other._info, _info));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_info));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PageInfoDtoCopyWith<_$_PageInfoDto> get copyWith =>
      __$$_PageInfoDtoCopyWithImpl<_$_PageInfoDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PageInfoDtoToJson(
      this,
    );
  }
}

abstract class _PageInfoDto implements PageInfoDto {
  const factory _PageInfoDto({required final List<InfoDto> info}) =
      _$_PageInfoDto;

  factory _PageInfoDto.fromJson(Map<String, dynamic> json) =
      _$_PageInfoDto.fromJson;

  @override
  List<InfoDto> get info;
  @override
  @JsonKey(ignore: true)
  _$$_PageInfoDtoCopyWith<_$_PageInfoDto> get copyWith =>
      throw _privateConstructorUsedError;
}
