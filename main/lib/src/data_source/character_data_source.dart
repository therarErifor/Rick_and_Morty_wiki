

import 'dto/info_dto.dart';

import 'dto/character_detailed_dto.dart';
import 'dto/character_dto.dart';
import 'dto/page_dto.dart';

abstract class CharacterDataSource{
  Future<PageDto> getPageAsync(int pageNumber);
  Future<CharacterDetailedDto> getCharacterDetailedAsync(int id);
  // Future<InfoDto> getInfoPagesAsync();


  //Future<InfoDto> getInfoAsync();
}



