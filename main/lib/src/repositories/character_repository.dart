import '../entities/character.dart';
import '../entities/character_detailed.dart';
import '../entities/character_page.dart';

abstract class CharacterRepository {
  Future<CharacterPage> getCharacterAsync(int pageNumber);
  Future<CharacterDetailed> getDetailedAsync(String id);
}