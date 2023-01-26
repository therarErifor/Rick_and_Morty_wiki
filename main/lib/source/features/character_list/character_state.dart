import '../../entities/character.dart';

abstract class CharacterState {}

class InitState extends CharacterState {}

class CharacterLoadState extends CharacterState {
  CharacterLoadState({required this.character});

  final List<Character> character;
}
