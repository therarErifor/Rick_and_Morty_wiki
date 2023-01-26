import 'package:flutter_bloc/flutter_bloc.dart';
import '../../repositories/character_repository.dart';
import 'character_events.dart';
import 'character_state.dart';


class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {

  final CharacterRepository _characterRepository;

  CharacterBloc(CharacterRepository characterRepository)
      : _characterRepository = characterRepository,
    super(

  InitState()

  ){
  _init(); //rename this
  }

  void _init() async {
    var character = await _characterRepository.getCharacterAsync(0);
    emit(CharacterLoadState(character: character));
  }
}

