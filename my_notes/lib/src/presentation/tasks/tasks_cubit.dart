import 'package:flutter_bloc/flutter_bloc.dart';

import 'tasks_state.dart';

class TasksCubit extends Cubit<TasksState>{
  TasksCubit():super(TasksInitState()){
    init();
  }

  void init() {
    emit(TasksScreenState());
  }
}