import 'package:dio/dio.dart';
import 'package:rick_and_morty_wiki/source/data_source/data_sourse.dart';

class CharacterRemoteDataSource implements CharacterDataSource{
  late Dio _dioClient;

  CharacterRemoteDataSource(){
    _dioClient = Dio();
    _dioClient.options.baseUrl = 'https://rickandmortyapi.com/api';
  }

  @override
  Future getDetailedAsync(String id) {
    // TODO: implement getDetailedAsync
    throw UnimplementedError();
  }

  @override
  Future<List> getFactsAsync(int startFrom, [int count = 10]) {
    // TODO: implement getFactsAsync
    throw UnimplementedError();
  }
}