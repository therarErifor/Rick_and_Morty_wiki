import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:rick_and_morty_wiki/src/common/error_messages.dart';
import 'package:rick_and_morty_wiki/src/data_source/character_data_source.dart';
import 'package:rick_and_morty_wiki/src/data_source/dto/character_detailed_dto.dart';
import 'package:dio/dio.dart';
import '../common/errors.dart';
import 'dto/page_dto.dart';

@Singleton(as: CharacterDataSource)
class CharacterRemoteDataSource implements CharacterDataSource {
  late Dio _dioClient;

  CharacterRemoteDataSource() {
    _dioClient = Dio();
    _dioClient.options.baseUrl = 'https://rickandmortyapi.com';
  }

  @override
  Future<Both<PageDto>> getPageAsync(int pageNumber) async {
    try {
      var response = await _dioClient.get('/api/character?page=$pageNumber');
      return Both.fromData(PageDto.fromJson(response.data));
    } on DioError catch (e) {
      if (e.isNoConnectionError) {
        return Both.fromError(NoConnect());
      }
      rethrow;
    }
  }

  @override
  Future<Both<CharacterDetailedDto>> getCharacterDetailedAsync(int id) async {
    try {
      var response = await _dioClient.get('/api/character/$id');
      return Both.fromData(CharacterDetailedDto.fromJson(response.data));
    } on DioError catch (e) {
      if (e.isNoConnectionError) {
        return Both.fromError(NoConnect());
      }
      rethrow;
    }
  }
}

extension DioErrorX on DioError {
  bool get isNoConnectionError {
    return this.type == DioErrorType.other && error is SocketException;
  }
}
