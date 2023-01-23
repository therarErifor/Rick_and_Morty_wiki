// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'page_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PageDto _$PageDtoFromJson(Map<String, dynamic> json) {
  return _PageDto.fromJson(json);
}

/// @nodoc
mixin _$PageDto {
  List<CharacterDto> get results => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PageDtoCopyWith<PageDto> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PageDtoCopyWith<$Res> {
  factory $PageDtoCopyWith(PageDto value, $Res Function(PageDto) then) =
      _$PageDtoCopyWithImpl<$Res, PageDto>;
  @useResult
  $Res call({List<CharacterDto> results});
}

/// @nodoc
class _$PageDtoCopyWithImpl<$Res, $Val extends PageDto>
    implements $PageDtoCopyWith<$Res> {
  _$PageDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? results = null,
  }) {
    return _then(_value.copyWith(
      results: null == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<CharacterDto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PageDtoCopyWith<$Res> implements $PageDtoCopyWith<$Res> {
  factory _$$_PageDtoCopyWith(
          _$_PageDto value, $Res Function(_$_PageDto) then) =
      __$$_PageDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<CharacterDto> results});
}

/// @nodoc
class __$$_PageDtoCopyWithImpl<$Res>
    extends _$PageDtoCopyWithImpl<$Res, _$_PageDto>
    implements _$$_PageDtoCopyWith<$Res> {
  __$$_PageDtoCopyWithImpl(_$_PageDto _value, $Res Function(_$_PageDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? results = null,
  }) {
    return _then(_$_PageDto(
      results: null == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<CharacterDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PageDto implements _PageDto {
  const _$_PageDto({required final List<CharacterDto> results})
      : _results = results;

  factory _$_PageDto.fromJson(Map<String, dynamic> json) =>
      _$$_PageDtoFromJson(json);

  final List<CharacterDto> _results;
  @override
  List<CharacterDto> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  String toString() {
    return 'PageDto(results: $results)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PageDto &&
            const DeepCollectionEquality().equals(other._results, _results));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_results));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PageDtoCopyWith<_$_PageDto> get copyWith =>
      __$$_PageDtoCopyWithImpl<_$_PageDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PageDtoToJson(
      this,
    );
  }
}

abstract class _PageDto implements PageDto {
  const factory _PageDto({required final List<CharacterDto> results}) =
      _$_PageDto;

  factory _PageDto.fromJson(Map<String, dynamic> json) = _$_PageDto.fromJson;

  @override
  List<CharacterDto> get results;
  @override
  @JsonKey(ignore: true)
  _$$_PageDtoCopyWith<_$_PageDto> get copyWith =>
      throw _privateConstructorUsedError;
}
