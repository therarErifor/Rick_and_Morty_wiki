import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_and_morty_wiki/src/common/error_messages.dart';
import '../../entities/character.dart';
import '../../repositories/character_repository.dart';
import 'character_events.dart';
import 'character_state.dart';

@Injectable()
class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  final CharacterRepository _characterRepository;
  late int _currentPage; //текущая страница
  late int _pagesCount; //количество страниц
  late List<Character> _characterLoaded = [];

  CharacterBloc(CharacterRepository characterRepository)
      : _characterRepository = characterRepository,
        super(InitCharacterState()) {
    _init();
    on((event, emit) {
      if (event is LoadMoreEvent) {
        _loadNextPage();
      }
      if (event is UpdatePage) {
        _loadNextPage();
      }
    });
  }

  void _loadNextPage() async {
    if (state is CharacterNextPageLoading) {
      return;
    }
    var nextPageNumber = _currentPage + 1;

    if (nextPageNumber < _pagesCount) {
      emit(CharacterNextPageLoading(character: _characterLoaded));
      var bothCharacterPage =
          await _characterRepository.getCharacterAsync(nextPageNumber);
      final characterPage = bothCharacterPage.data;
      if ((characterPage != null) && (bothCharacterPage.error == null)) {
        _currentPage = nextPageNumber;
        _characterLoaded.addAll(characterPage.character);
        emit(CharacterLoadState(character: _characterLoaded));
      } else if (bothCharacterPage.error is NoConnect) {
        emit(NetworkError());
      }
    }
  }

  void _init() async {
    _currentPage = 1;
    var _bothCharacterPage =
        await _characterRepository.getCharacterAsync(_currentPage);
    final characterPage = _bothCharacterPage.data;
    if ((characterPage != null) && (_bothCharacterPage.error == null)) {
      _pagesCount = characterPage.pagesCount;
      _characterLoaded.addAll(characterPage.character);
      emit(CharacterLoadState(character: _characterLoaded));
    } else if (_bothCharacterPage.error != null) {
      emit(NetworkError());
    }
  }
}
