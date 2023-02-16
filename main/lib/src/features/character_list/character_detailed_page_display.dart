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
        width: 300,
        margin: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(characterDetailed.imageUrl),
            ),
            SizedBox(height: 15),
            Card(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('№ ' + characterDetailed.id.toString(),
                        style: TextStyle(fontSize: 22, color: Colors.blueGrey)),
                    SizedBox(height: 15),
                    Text('Name:'),
                    Container(
                      width: 300,
                      child: Text(characterDetailed.name,
                          style:
                              TextStyle(fontSize: 22, color: Colors.blueGrey),
                          softWrap: true),
                    ),
                    SizedBox(height: 15),
                    Text('Status:'),
                    if (characterDetailed.status == 'Dead')
                      Row(
                        children: [
                          Container(
                            width: 10.0,
                            height: 10.0,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                          ),
                          Text(' ' + characterDetailed.status,
                              style: TextStyle(
                                  fontSize: 22, color: Colors.blueGrey)),
                        ],
                      ),
                    if (characterDetailed.status == 'Alive')
                      Row(
                        children: [
                          Container(
                            width: 10.0,
                            height: 10.0,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              shape: BoxShape.circle,
                            ),
                          ),
                          Text(' ' + characterDetailed.status,
                              style: TextStyle(
                                  fontSize: 22, color: Colors.blueGrey)),
                        ],
                      ),
                    if (characterDetailed.status == 'unknown')
                      Row(
                        children: [
                          Container(
                            width: 10.0,
                            height: 10.0,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              shape: BoxShape.circle,
                            ),
                          ),
                          Text(' ' + characterDetailed.status,
                              style: TextStyle(
                                  fontSize: 22, color: Colors.blueGrey)),
                        ],
                      ),
                    SizedBox(height: 15),
                    Text('Gender:'),
                    Text(characterDetailed.gender,
                        style: TextStyle(fontSize: 22, color: Colors.blueGrey)),
                    SizedBox(height: 15),
                    Text('Last known location:'),
                    Text(
                      characterDetailed.locationName,
                      style: TextStyle(fontSize: 22, color: Colors.blueGrey),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      );
    }

    return SizedBox.shrink();
  }
}
