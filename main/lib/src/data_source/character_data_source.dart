

import 'dto/character_detailed_dto.dart';
import 'dto/character_dto.dart';

abstract class CharacterDataSource{
  Future<List<CharacterDto>> getCharactersAsync(int startFrom);
  Future<CharacterDetailedDto> getCharacterDetailedAsync(String id);
}



