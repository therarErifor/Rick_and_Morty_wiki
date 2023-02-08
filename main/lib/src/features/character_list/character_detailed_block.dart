import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repositories/character_repository.dart';
import '../../entities/character_detailed.dart';
import 'character_detailed_event.dart';
import 'character_detailed_state.dart';

class CharacterDetailedBloc extends Bloc<CharacterDetailedEvent, CharacterDetailedState>{
  final CharacterRepository _characterRepository;
  late String _characterId;
  CharacterDetailedBloc(CharacterRepository characterRepository)
      : _characterRepository = characterRepository,
  super(InitCharacterDetailedState()) {
    _initCharacterDetailed();
    on((event, emit){
      if (event is CharacterDetailedLoadState){
       _initCharacterDetailed();
      }
    });
  }

  void _initCharacterDetailed() async {
    CharacterDetailedEvent characterDetailedEvent;
    var characterDetailed = await _characterRepository.getDetailedAsync(_characterId);
    emit(CharacterDetailedLoadState(characterDetailed: characterDetailed));
  }
}



