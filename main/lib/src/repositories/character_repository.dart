import '../entities/character_detailed.dart';
import '../entities/character_page.dart';
import '../entities/page_info.dart';

abstract class CharacterRepository {
  Future<CharacterPage> getCharacterAsync(int pageNumber);
  Future<CharacterDetailed> getDetailedAsync(String id);
  //Future<Info>getInfoAsync();
  Future<PageInfo> getPageInfoAsync();
}
