abstract class CharacterDataSource{
  Future<List<CharacterDto>> getFactsAsync(int startFrom, [int count = 10]);
  Future<CharacterDetailedDto> getDetailedAsync(String id);
}
}


