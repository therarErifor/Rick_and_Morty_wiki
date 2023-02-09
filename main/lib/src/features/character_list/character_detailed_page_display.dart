import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty_wiki/src/data_source/character_remote_data_source.dart';
import 'package:rick_and_morty_wiki/src/repositories/character_repository_imp.dart';

import 'character_detailed_block.dart';

import 'character_detailed_state.dart';

class CharacterDetailedPage extends StatelessWidget {
  final int _id;

  CharacterDetailedPage(int id) : _id = id {}

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CharacterDetailedBloc>(
      create: (_) => CharacterDetailedBloc(
          CharacterRepositoryImp(CharacterRemoteDataSource()), _id),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('about the character'),
        ),
        body: BlocBuilder<CharacterDetailedBloc, CharacterDetailedState>(
          builder: _BuildCharacterDetailed,
        ),
      ),
    );
  }

  Widget _BuildCharacterDetailed(
      BuildContext context, CharacterDetailedState state) {
    if (state is InitCharacterDetailedState) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    if (state is CharacterDetailedLoadState) {
      var characterDetailed = state.characterDetailed;
      return Card(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image.network(characterDetailed.imageUrl),
              Text('Name: ' + characterDetailed.name),
              Text('Status: ' + characterDetailed.status),
              Text('Gender: ' + characterDetailed.gender),
              Text('Location: ' + characterDetailed.locationName),
            ]),
      );
    }

    return SizedBox.shrink();
  }
}
