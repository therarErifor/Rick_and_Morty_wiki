import '../common/errors.dart';
import '../entities/character_detailed.dart';
import '../entities/character_page.dart';

abstract class CharacterRepository {
  Future<Both<CharacterPage>> getCharacterAsync(int pageNumber);

  Future<CharacterDetailed> getDetailedAsync(int id);
}
