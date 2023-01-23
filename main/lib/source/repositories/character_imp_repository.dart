import 'package:rick_and_morty_wiki/source/entities/character.dart';
import 'package:rick_and_morty_wiki/source/entities/character_detailed.dart';
import 'package:rick_and_morty_wiki/source/repositories/character_repository.dart';

import '../data_source/data_sourse.dart';

class CharacterRepositoryImp extends CharacterRepositoty {
  final CharacterDataSource _characterDataSource;

  CharacterRepositoryImp(CharacterDataSource characterDataSource)
      : _characterDataSource = characterDataSource;

  @override
  Future<List<Character>> getCharacterAsync(int pageNumber) async {
    var dtoList = await _characterDataSource.getCharactersAsync(pageNumber);
    return dtoList
        .map((dto) =>
            Character(id: dto.id ?? 0, name: dto.name, imageUrl: dto.image))
        .toList();
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
}
