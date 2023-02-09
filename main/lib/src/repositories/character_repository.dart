import '../entities/character.dart';
import '../entities/character_detailed.dart';
import '../entities/character_page.dart';
import '../entities/info.dart';


abstract class CharacterRepository {

  Future<CharacterPage> getCharacterAsync(int pageNumber);
  Future<CharacterDetailed> getDetailedAsync(int id);
  // Future<Info>getInfoAsync();
  //Future<Info>getInfoPagesAsync();
}