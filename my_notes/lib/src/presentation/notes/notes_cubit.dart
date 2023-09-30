import 'package:flutter_bloc/flutter_bloc.dart';

import 'notes_state.dart';

class NotesCubit extends Cubit<NotesState>{
  NotesCubit():super(NotesInitState()){
    init();
  }

  void init() {
    emit(NotesScreenState());
  }
}