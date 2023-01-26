import '../entities/character.dart';
import '../entities/character_detailed.dart';

abstract class CharacterRepository {
  Future<List<Character>> getCharacterAsync(int pageNumber);
  Future<CharacterDetailed> getDetailedAsync(String id);
}