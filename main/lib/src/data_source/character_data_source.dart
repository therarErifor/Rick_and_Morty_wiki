

import 'dto/info_dto.dart';
import 'dto/page_info_dto.dart';
import 'dto/character_detailed_dto.dart';
import 'dto/character_dto.dart';

abstract class CharacterDataSource{
  Future<List<CharacterDto>> getCharactersAsync(int pageNumber);
  Future<CharacterDetailedDto> getCharacterDetailedAsync(String id);
  Future<List<InfoDto>> getInfoAsync();


  //Future<InfoDto> getInfoAsync();
}



