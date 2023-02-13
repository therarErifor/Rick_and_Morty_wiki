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
      return Container(
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image.network(characterDetailed.imageUrl),
              SizedBox(height: 15),
              Text('№' + characterDetailed.id.toString(),
                  style: TextStyle(fontSize: 22, color: Colors.blueGrey)),
              SizedBox(height: 15),
              Text('Name:'),
              Text(characterDetailed.name,
                  style: TextStyle(fontSize: 22, color: Colors.blueGrey)),
              SizedBox(height: 15),
              Text('Status:'),
              Text(characterDetailed.status,
                  style: TextStyle(fontSize: 22, color: Colors.blueGrey)),
              SizedBox(height: 15),
              Text('Gender:'),
              Text(characterDetailed.gender,
                  style: TextStyle(fontSize: 22, color: Colors.blueGrey)),
              SizedBox(height: 15),
              Text('Last known location:'),
              Text(characterDetailed.locationName,
                  style: TextStyle(fontSize: 22, color: Colors.blueGrey),
                  softWrap: true),
            ],
          ),
        ),
      );
    }

    return SizedBox.shrink();
  }
}
