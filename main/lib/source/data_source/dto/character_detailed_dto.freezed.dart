// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'character_detailed_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CharacterDetailedDto _$CharacterDetailedDtoFromJson(Map<String, dynamic> json) {
  return _CharacterDetailedDto.fromJson(json);
}

/// @nodoc
mixin _$CharacterDetailedDto {
  int? get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get gender => throw _privateConstructorUsedError;
  CharacterLocation get location => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CharacterDetailedDtoCopyWith<CharacterDetailedDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CharacterDetailedDtoCopyWith<$Res> {
  factory $CharacterDetailedDtoCopyWith(CharacterDetailedDto value,
          $Res Function(CharacterDetailedDto) then) =
      _$CharacterDetailedDtoCopyWithImpl<$Res, CharacterDetailedDto>;
  @useResult
  $Res call(
      {int? id,
      String name,
      String status,
      String gender,
      CharacterLocation location,
      String image});

  $CharacterLocationCopyWith<$Res> get location;
}

/// @nodoc
class _$CharacterDetailedDtoCopyWithImpl<$Res,
        $Val extends CharacterDetailedDto>
    implements $CharacterDetailedDtoCopyWith<$Res> {
  _$CharacterDetailedDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? status = null,
    Object? gender = null,
    Object? location = null,
    Object? image = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as CharacterLocation,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CharacterLocationCopyWith<$Res> get location {
    return $CharacterLocationCopyWith<$Res>(_value.location, (value) {
      return _then(_value.copyWith(location: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_CharacterDetailedDtoCopyWith<$Res>
    implements $CharacterDetailedDtoCopyWith<$Res> {
  factory _$$_CharacterDetailedDtoCopyWith(_$_CharacterDetailedDto value,
          $Res Function(_$_CharacterDetailedDto) then) =
      __$$_CharacterDetailedDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String name,
      String status,
      String gender,
      CharacterLocation location,
      String image});

  @override
  $CharacterLocationCopyWith<$Res> get location;
}

/// @nodoc
class __$$_CharacterDetailedDtoCopyWithImpl<$Res>
    extends _$CharacterDetailedDtoCopyWithImpl<$Res, _$_CharacterDetailedDto>
    implements _$$_CharacterDetailedDtoCopyWith<$Res> {
  __$$_CharacterDetailedDtoCopyWithImpl(_$_CharacterDetailedDto _value,
      $Res Function(_$_CharacterDetailedDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? status = null,
    Object? gender = null,
    Object? location = null,
    Object? image = null,
  }) {
    return _then(_$_CharacterDetailedDto(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as CharacterLocation,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CharacterDetailedDto implements _CharacterDetailedDto {
  const _$_CharacterDetailedDto(
      {required this.id,
      required this.name,
      required this.status,
      required this.gender,
      required this.location,
      required this.image});

  factory _$_CharacterDetailedDto.fromJson(Map<String, dynamic> json) =>
      _$$_CharacterDetailedDtoFromJson(json);

  @override
  final int? id;
  @override
  final String name;
  @override
  final String status;
  @override
  final String gender;
  @override
  final CharacterLocation location;
  @override
  final String image;

  @override
  String toString() {
    return 'CharacterDetailedDto(id: $id, name: $name, status: $status, gender: $gender, location: $location, image: $image)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CharacterDetailedDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, status, gender, location, image);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CharacterDetailedDtoCopyWith<_$_CharacterDetailedDto> get copyWith =>
      __$$_CharacterDetailedDtoCopyWithImpl<_$_CharacterDetailedDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CharacterDetailedDtoToJson(
      this,
    );
  }
}

abstract class _CharacterDetailedDto implements CharacterDetailedDto {
  const factory _CharacterDetailedDto(
      {required final int? id,
      required final String name,
      required final String status,
      required final String gender,
      required final CharacterLocation location,
      required final String image}) = _$_CharacterDetailedDto;

  factory _CharacterDetailedDto.fromJson(Map<String, dynamic> json) =
      _$_CharacterDetailedDto.fromJson;

  @override
  int? get id;
  @override
  String get name;
  @override
  String get status;
  @override
  String get gender;
  @override
  CharacterLocation get location;
  @override
  String get image;
  @override
  @JsonKey(ignore: true)
  _$$_CharacterDetailedDtoCopyWith<_$_CharacterDetailedDto> get copyWith =>
      throw _privateConstructorUsedError;
}
