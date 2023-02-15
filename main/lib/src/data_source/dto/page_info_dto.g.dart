// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page_info_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PageInfoDto _$$_PageInfoDtoFromJson(Map<String, dynamic> json) =>
    _$_PageInfoDto(
      info: (json['info'] as List<dynamic>)
          .map((e) => InfoDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_PageInfoDtoToJson(_$_PageInfoDto instance) =>
    <String, dynamic>{
      'info': instance.info,
    };
