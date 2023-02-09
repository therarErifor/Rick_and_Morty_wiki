import 'package:freezed_annotation/freezed_annotation.dart';

import 'character_dto.dart';
import 'info_dto.dart';

part 'page_dto.freezed.dart';

part 'page_dto.g.dart';

@freezed
class PageDto with _$PageDto {
  //const factory PageDto ( {required List<CharacterDto> results, required List<info>}) = _PageDto;
  const factory PageDto({required List<CharacterDto> results, required InfoDto info}) = _PageDto;

  factory PageDto.fromJson(Map<String, dynamic> json) =>
      _$PageDtoFromJson(json);
}
