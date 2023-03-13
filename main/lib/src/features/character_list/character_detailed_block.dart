import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_and_morty_wiki/src/features/character_list/character_state.dart';
import '../../repositories/character_repository.dart';
import 'character_detailed_event.dart';
import 'character_detailed_state.dart';

@Injectable()
class CharacterDetailedBloc
    extends Bloc<CharacterDetailedEvent, CharacterDetailedState> {
  final CharacterRepository _characterRepository;

  late int _characterId;

  CharacterDetailedBloc(
      CharacterRepository characterRepository, @factoryParam int id)
      : _characterRepository = characterRepository,
        _characterId = id,
        super(InitCharacterDetailedState()) {
    _initCharacterDetailed();
  }

  void _initCharacterDetailed() async {
    var _bothCharacterDetailed =
        await _characterRepository.getDetailedAsync(_characterId);
    final characterDetailed = _bothCharacterDetailed.data;
    if ((characterDetailed != null)&&(_bothCharacterDetailed.error == null)) {
      emit(CharacterDetailedLoadState(characterDetailed: characterDetailed));
    }else if(_bothCharacterDetailed.error != null) {
      emit(DetailedNetworkError());
    }
  }
}
