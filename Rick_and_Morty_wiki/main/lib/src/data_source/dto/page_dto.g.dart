// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PageDto _$$_PageDtoFromJson(Map<String, dynamic> json) => _$_PageDto(
      results: (json['results'] as List<dynamic>)
          .map((e) => CharacterDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      info: InfoDto.fromJson(json['info'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_PageDtoToJson(_$_PageDto instance) =>
    <String, dynamic>{
      'results': instance.results,
      'info': instance.info,
    };
