

import 'dto/character_detailed_dto.dart';
import 'dto/character_dto.dart';

abstract class CharacterDataSource{
  Future<List<CharacterDto>> getFactsAsync(int startFrom, [int count = 10]);
  Future<CharacterDetailedDto> getDetailedAsync(String id);
}



