import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_notes/src/presentation/notes/notes_cubit.dart';

import 'notes_state.dart';

@RoutePage()
class NotesPage extends StatelessWidget {
  NotesCubit? _cubit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NotesCubit>(
      create: (_) => NotesCubit(),
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        body: BlocBuilder<NotesCubit, NotesState>(builder: _buildBody),
      ),
    );
  }

  Widget _buildBody(BuildContext context, NotesState state) {
    _cubit = context.read<NotesCubit>();

    if (state is NotesInitState) {
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

    if (state is NotesScreenState) {
      return _buildHomeScreen(context, state);
    }
    return SizedBox.shrink();
  }

  Widget _buildHomeScreen(BuildContext context, NotesScreenState state) {
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
          ],
        ),
      ),
    );
  }
}