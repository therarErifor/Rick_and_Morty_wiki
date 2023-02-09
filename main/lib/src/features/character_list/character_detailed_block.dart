import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repositories/character_repository.dart';
import '../../entities/character_detailed.dart';
import 'character_detailed_event.dart';
import 'character_detailed_state.dart';

class CharacterDetailedBloc extends Bloc<CharacterDetailedEvent, CharacterDetailedState>{
  final CharacterRepository _characterRepository;

  late int _characterId;
  CharacterDetailedBloc(CharacterRepository characterRepository, int id)
      : _characterRepository = characterRepository, _characterId = id,
  super(InitCharacterDetailedState()) {
    _initCharacterDetailed();
  }

  void _initCharacterDetailed() async {
    var characterDetailed = await _characterRepository.getDetailedAsync(_characterId);
    emit(CharacterDetailedLoadState(characterDetailed: characterDetailed));
  }
}



