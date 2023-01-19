import '../entities/character.dart';
import '../entities/character_detailed.dart';

abstract class Repositoty {
  Future<List<Character>> getCharacterAsync(int startFrom, [int count = 10]);
  Future<CharacterDetailed> getDetailedAsync(String id);
}