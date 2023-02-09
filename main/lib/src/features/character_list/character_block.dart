import 'package:flutter_bloc/flutter_bloc.dart';
import '../../entities/character.dart';
import '../../repositories/character_repository.dart';
import 'character_events.dart';
import 'character_state.dart';

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
    });
  }

  void _loadNextPage() async {
    var nextPageNumber = _currentPage + 1;

    if (nextPageNumber < _pagesCount) {
      emit(CharacterNextPageLoading(character: _characterLoaded));
      var characterPage =
          await _characterRepository.getCharacterAsync(nextPageNumber);
      _currentPage = nextPageNumber;
      _characterLoaded.addAll(characterPage.character);
      emit(CharacterLoadState(character: _characterLoaded));
    }
  }

  void _init() async {
    _currentPage = 0;
    var characterPage =
        await _characterRepository.getCharacterAsync(_currentPage);
    _pagesCount = characterPage.pagesCount;
    _characterLoaded.addAll(characterPage.character);
    emit(CharacterLoadState(character: _characterLoaded));
  }
}
