import '../../entities/character.dart';

abstract class CharacterState {}

class InitCharacterState extends CharacterState {}

class NetworkError extends CharacterState{
}

class CharacterListState extends CharacterState {
  final List<Character> character;

  CharacterListState({required this.character});
}

class CharacterLoadState extends CharacterListState {
  CharacterLoadState({required super.character});
}

class CharacterNextPageLoading extends CharacterListState {

  CharacterNextPageLoading({required super.character});
}
