import 'package:freezed_annotation/freezed_annotation.dart';
//import 'package:flutter/foundation.dart';

part 'character_dto.freezed.dart';
part 'character_dto.g.dart';

@freezed
class CharacterDto with _$CharacterDto{
  const factory CharacterDto({required int? id, required  String name}) = _CharacterDto;

 factory CharacterDto.fromJson(Map<String, dynamic>json) => _$CharacterDtoFromJson(json);
}




