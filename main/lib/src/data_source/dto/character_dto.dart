import 'package:freezed_annotation/freezed_annotation.dart';


part 'character_dto.freezed.dart';
part 'character_dto.g.dart';

@freezed
class CharacterDto with _$CharacterDto{
  const factory CharacterDto({required int? id, required  String name, required String image}) = _CharacterDto;

 factory CharacterDto.fromJson(Map<String, dynamic>json) => _$CharacterDtoFromJson(json);
}




