import 'package:rick_and_morty_wiki/source/data_source/data_sourse.dart';
import 'package:rick_and_morty_wiki/source/data_source/dto/character_dto.dart';
import 'package:rick_and_morty_wiki/source/data_source/dto/character_detailed_dto.dart';
import 'package:dio/dio.dart';

import 'dto/page_dto.dart';

class CharacterRemoteDataSource implements CharacterDataSource {
  late Dio _dioClient;

  CharacterRemoteDataSource() {
    _dioClient = Dio();
    _dioClient.options.baseUrl = 'https://rickandmortyapi.com';
  }

  @override
  Future<List<CharacterDto>> getCharactersAsync(int pageNumber,
      [int count = 10]) async {
    var response = await _dioClient.get('/api/character?page=$pageNumber');
    return PageDto.fromJson(response.data).results;

  }

  @override
  Future<CharacterDetailedDto> getCharacterDetailedAsync(String id) async {
    var response = await _dioClient.get('/api/character/$id');
    return CharacterDetailedDto.fromJson(response.data);

  }


}