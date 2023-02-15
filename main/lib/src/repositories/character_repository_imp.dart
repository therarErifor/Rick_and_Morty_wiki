import 'package:rick_and_morty_wiki/src/entities/character.dart';
import 'package:rick_and_morty_wiki/src/entities/character_detailed.dart';
import 'package:rick_and_morty_wiki/src/entities/page_info.dart';
import 'package:rick_and_morty_wiki/src/repositories/character_repository.dart';

import '../data_source/character_data_source.dart';
import '../entities/character_page.dart';
import '../entities/info.dart';

class CharacterRepositoryImp extends CharacterRepository {
  final CharacterDataSource _characterDataSource;

  CharacterRepositoryImp(CharacterDataSource characterDataSource)
      : _characterDataSource = characterDataSource;

  @override
  Future<CharacterPage> getCharacterAsync(int pageNumber) async {
    var infoList = await getPageInfoAsync();
    var pagesCount = infoList.info.last;
    var dtoList = await _characterDataSource.getCharactersAsync(pageNumber);
    var character = dtoList
        .map((dto) =>
            Character(id: dto.id ?? 0, name: dto.name, imageUrl: dto.image))
        .toList();
    return CharacterPage(character: character, pagesCount: pagesCount.pages);
  }

  @override
  Future<PageInfo> getPageInfoAsync() async {
    var infoDtoList = await _characterDataSource.getInfoAsync();

    var info = infoDtoList
        .map((dto) => Info(count: dto.count ?? 0, pages: dto.pages ?? 0))
        .toList();
    return PageInfo(info: info);
  }

//id ?? 0 Сравнение с нулем (погугли потом)
  @override
  Future<CharacterDetailed> getDetailedAsync(String id) async {
    var dtoCharacterDetailed =
        await _characterDataSource.getCharacterDetailedAsync(id);

    return CharacterDetailed(
        id: dtoCharacterDetailed.id ?? 0,
        name: dtoCharacterDetailed.name,
        imageUrl: dtoCharacterDetailed.image,
        status: dtoCharacterDetailed.status,
        gender: dtoCharacterDetailed.gender,
        locationName: dtoCharacterDetailed.location.name);
  }

// @override
// Future<Info> InfoAsync() async {
//   var dtoPageInfo = await _characterDataSource.getPageInfoAsync();
//   return PageInfo(
//       count: dtoPageInfo.count ?? 0,
//       pages: dtoPageInfo.pages ?? 0);
// }

}
