import 'package:injectable/injectable.dart';
import 'package:rick_and_morty_wiki/src/data_source/character_data_source.dart';
import 'package:rick_and_morty_wiki/src/data_source/dto/character_detailed_dto.dart';
import 'package:dio/dio.dart';
import 'package:rick_and_morty_wiki/src/data_source/character_data_source.dart';
import 'package:rick_and_morty_wiki/src/data_source/dto/character_detailed_dto.dart';
import 'package:rick_and_morty_wiki/src/data_source/dto/character_dto.dart';
import 'package:rick_and_morty_wiki/src/data_source/dto/info_dto.dart';

import 'dto/page_dto.dart';

@Singleton(as: CharacterDataSource)
class CharacterRemoteDataSource implements CharacterDataSource {
  late Dio _dioClient;

  CharacterRemoteDataSource() {
    _dioClient = Dio();
    _dioClient.options.baseUrl = 'https://rickandmortyapi.com';
  }

  @override
  Future<PageDto> getPageAsync(int pageNumber) async {
    var response = await _dioClient.get('/api/character?page=$pageNumber');
    return PageDto.fromJson(response.data);
  }

  @override
  Future<CharacterDetailedDto> getCharacterDetailedAsync(int id) async {
    var response = await _dioClient.get('/api/character/$id');
    return CharacterDetailedDto.fromJson(response.data);
  }
}
