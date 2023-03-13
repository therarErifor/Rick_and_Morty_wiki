import '../../entities/character_detailed.dart';
import 'character_state.dart';

class CharacterDetailedState extends CharacterState {}

class InitCharacterDetailedState extends CharacterDetailedState {}
class DetailedNetworkError extends CharacterDetailedState{}
class CharacterDetailedLoadState extends CharacterDetailedState {
  CharacterDetailedLoadState({required this.characterDetailed});

  final CharacterDetailed characterDetailed;
}
