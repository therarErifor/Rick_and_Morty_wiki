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
    return const SizedBox.shrink();
  }

  Widget _buildHomeScreen(BuildContext context, NotesScreenState state) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool searchFieldIsScrolled) {
            return <Widget> [
              SliverAppBar(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                title: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  height: 60,
                  child: TextFormField(
                    decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: const Icon(Icons.search),
                      label: const Text("Search"),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                          const BorderSide(color: Colors.white, width: 0),
                          borderRadius: BorderRadius.circular(10)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                          const BorderSide(color: Colors.white, width: 0),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),
              )
            ];
          },
          body: Container(
            width: MediaQuery.of(context).size.height,
            margin: const EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: const ListTile(
                      title: Text('This is tittle'),
                      subtitle: Text('This is subtittle'),
                      leading: VerticalDivider(thickness: 1, color: Colors.green,),
                      trailing: Text('This is trailing'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}