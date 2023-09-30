import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_notes/src/presentation/tasks/tasks_cubit.dart';
import 'package:my_notes/src/presentation/tasks/tasks_state.dart';

@RoutePage()
class TasksPage extends StatelessWidget {
  TasksCubit? _cubit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TasksCubit>(
      create: (_) => TasksCubit(),
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        body: BlocBuilder<TasksCubit, TasksState>(builder: _buildBody),
      ),
    );
  }

  Widget _buildBody(BuildContext context, TasksState state) {
    _cubit = context.read<TasksCubit>();

    if (state is TasksInitState) {
      return const Center(
          child:
          SimpleDialog(backgroundColor: Colors.white70, children: <Widget>[
            Column(children: [
              CircularProgressIndicator(),
              SizedBox(
                height: 10,
              ),
              Text('please_wait')
            ])
          ]));
    }

    if (state is TasksScreenState) {
      return _buildHomeScreen(context, state);
    }
    return SizedBox.shrink();
  }

  Widget _buildHomeScreen(BuildContext context, TasksScreenState state) {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.height,
        height: MediaQuery.of(context).size.height,
        margin: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40),
            Text('This is tasks')
          ],
        ),
      ),
    );
  }
}