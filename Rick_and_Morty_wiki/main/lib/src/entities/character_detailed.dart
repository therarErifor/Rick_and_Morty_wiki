import 'character.dart';

class CharacterDetailed extends Character {
  CharacterDetailed(
      {required super.id,
      required super.name,
      required super.imageUrl,
      required this.status,
      required this.gender,
      required this.locationName});

  final String status;
  final String gender;
  final String locationName;
}
