import 'package:injectable/injectable.dart';
import 'package:rick_and_morty_wiki/src/common/errors.dart';
import 'package:rick_and_morty_wiki/src/entities/character.dart';
import 'package:rick_and_morty_wiki/src/entities/character_detailed.dart';

import 'package:rick_and_morty_wiki/src/repositories/character_repository.dart';
import '../data_source/character_data_source.dart';
import '../entities/character_page.dart';

@Singleton(as: CharacterRepository)
class CharacterRepositoryImp extends CharacterRepository {
  final CharacterDataSource _characterDataSource;

  CharacterRepositoryImp(CharacterDataSource characterDataSource)
      : _characterDataSource = characterDataSource;

  @override
  Future<Both<CharacterPage>> getCharacterAsync(int pageNumber) async {
    final _both = await _characterDataSource.getPageAsync(pageNumber);
    final pageDto = _both.data;
    if ((_both.isSuccessTheBoth == true)&&(_both.data != null)&&(pageDto != null)) {
      var character = pageDto.results
          .map((dto) =>
              Character(id: dto.id ?? 0, name: dto.name, imageUrl: dto.image))
          .toList();
      return Both(
          CharacterPage(character: character, pagesCount: pageDto.info.pages),
          null);
    } else {
      return Both(null, _both.error);
    }
  }

//id ?? 0 Сравнение с нулем
  @override
  Future<CharacterDetailed> getDetailedAsync(int id) async {
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
}
