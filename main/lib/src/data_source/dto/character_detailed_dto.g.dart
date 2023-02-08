// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_detailed_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CharacterDetailedDto _$$_CharacterDetailedDtoFromJson(
        Map<String, dynamic> json) =>
    _$_CharacterDetailedDto(
      id: json['id'] as int?,
      name: json['name'] as String,
      status: json['status'] as String,
      gender: json['gender'] as String,
      location:
          CharacterLocation.fromJson(json['location'] as Map<String, dynamic>),
      image: json['image'] as String,
    );

Map<String, dynamic> _$$_CharacterDetailedDtoToJson(
        _$_CharacterDetailedDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'status': instance.status,
      'gender': instance.gender,
      'location': instance.location,
      'image': instance.image,
    };
