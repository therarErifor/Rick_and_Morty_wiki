import 'package:freezed_annotation/freezed_annotation.dart';

import 'info_dto.dart';

part 'page_info_dto.freezed.dart';
part 'page_info_dto.g.dart';

@freezed
class PageInfoDto with _$PageInfoDto {
  const factory PageInfoDto({required List<InfoDto> info}) = _PageInfoDto;

  factory PageInfoDto.fromJson(Map<String, dynamic> json) =>
      _$PageInfoDtoFromJson(json);
}
