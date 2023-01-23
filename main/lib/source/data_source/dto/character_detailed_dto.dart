import 'package:freezed_annotation/freezed_annotation.dart';

import 'character_location.dart';
part 'character_detailed_dto.freezed.dart';

part 'character_detailed_dto.g.dart';

@freezed
class CharacterDetailedDto with _$CharacterDetailedDto {
  const factory CharacterDetailedDto(
      {required int? id,
      required String name,
        required String status,
        required String gender,
        required CharacterLocation location,
      required String image}) = _CharacterDetailedDto;

  factory CharacterDetailedDto.fromJson(Map<String, dynamic> json) =>
      _$CharacterDetailedDtoFromJson(json);
}
