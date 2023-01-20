import 'package:rick_and_morty_wiki/source/data_source/data_sourse.dart';
import 'package:rick_and_morty_wiki/source/data_source/dto/character_dto.dart';
import 'package:rick_and_morty_wiki/source/data_source/dto/character_detailed_dto.dart';
import 'package:dio/dio.dart';

class CharacterRemoteDataSource implements CharacterDataSource{
  late Dio _dioClient;

  CharacterRemoteDataSource(){
    _dioClient = Dio();
    _dioClient.options.baseUrl = 'https://rickandmortyapi.com/api/character';
  }

  @override
  Future<CharacterDetailedDto> getDetailedAsync(String id) {
    // TODO: implement getDetailedAsync
    throw UnimplementedError();
  }

  @override
  Future<List<CharacterDto>> getFactsAsync(int startFrom, [int count = 10]) {
    // TODO: implement getFactsAsync
    throw UnimplementedError();
  }

 
}