import 'package:rick_and_morty_wiki/src/data_source/character_data_source.dart';
import 'package:rick_and_morty_wiki/src/data_source/dto/character_dto.dart';
import 'package:rick_and_morty_wiki/src/data_source/dto/character_detailed_dto.dart';
import 'package:dio/dio.dart';
import 'package:rick_and_morty_wiki/src/data_source/dto/info_dto.dart';
import 'package:rick_and_morty_wiki/src/data_source/dto/page_info_dto.dart';
import 'dto/page_dto.dart';

class CharacterRemoteDataSource implements CharacterDataSource {
  late Dio _dioClient;

  CharacterRemoteDataSource() {
    _dioClient = Dio();
    _dioClient.options.baseUrl = 'https://rickandmortyapi.com';
  }

  @override
  Future<List<CharacterDto>> getCharactersAsync(int pageNumber) async {
    var response = await _dioClient.get('/api/character?page=$pageNumber');
    return PageDto.fromJson(response.data).results;

  }

  @override
  Future <List<InfoDto>> getInfoAsync() async {
    var response = await _dioClient.get('/api/character');
    return PageInfoDto.fromJson(response.data).info;
  }

  @override
  Future<CharacterDetailedDto> getCharacterDetailedAsync(String id) async {
    var response = await _dioClient.get('/api/character/$id');
    return CharacterDetailedDto.fromJson(response.data);

  }




  // @override
  // Future<InfoDto> getInfoAsync() async {
  //   var response = await _dioClient.get('/api/character');
  //   return InfoDto.fromJson(response.data);
  // }


}