import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty_wiki/src/data_source/character_remote_data_source.dart';
import 'package:rick_and_morty_wiki/src/repositories/character_repository_imp.dart';
import 'character_block.dart';
import 'character_detailed_block.dart';
import 'character_detailed_event.dart';
import 'character_detailed_state.dart';
import 'character_events.dart';
import 'character_state.dart';
import '../../entities/character.dart';

class CharacterPage extends StatelessWidget {
  late ScrollController _scrollController;

  CharacterBloc? _bloc;

  CharacterPage() {
    _scrollController = ScrollController()
      ..addListener(() {
        //двойная точка - это конструкция
        var extentPosition = _scrollController.position.extentAfter;
        if (extentPosition < 300) {
          _bloc?.add(LoadMoreEvent());
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CharacterBloc>(
      create: (_) =>
          CharacterBloc(CharacterRepositoryImp(CharacterRemoteDataSource())),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Rick and Morty Wiki'),
        ),
        body: BlocBuilder<CharacterBloc, CharacterState>(
          builder: _buildBody,
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context, CharacterState state) {
    _bloc = context.read<CharacterBloc>();
    if (state is InitCharacterState) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    if (state is CharacterListState) {
      return Column(
        children: [
          Expanded(
            child: _buildCharacterList(context, state.character),
          ),
          if (state is CharacterNextPageLoading)
            const Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
        ],
      );
    }

    return const SizedBox.shrink();
  }

  ListView _buildCharacterList(
      BuildContext context, List<Character> character) {
    return ListView.builder(
      controller: _scrollController,
      padding: const EdgeInsets.only(left: 10, right: 10),
      itemBuilder: (_, index) => Card(
        child: ListTile(
          contentPadding:
              EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
          leading: Image.network(character[index].imageUrl),
          title: Text(
            character[index].name,
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (index) => CharacterDetailedPage()),
            );
            //_characterDetailedPage();
          },
        ),
      ),
      itemCount: character.length,
    );
  }
}

class CharacterDetailedPage extends StatelessWidget {
  //const CharacterDetailedPage();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CharacterDetailedBloc>(
      create: (_) => CharacterDetailedBloc(
          CharacterRepositoryImp(CharacterRemoteDataSource())),
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
}

Widget _BuildCharacterDetailed(
    BuildContext context, CharacterDetailedState state) {
  if (state is InitCharacterDetailedState) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
  if (state is CharacterDetailedLoadState) {
    //CharacterDetailedEvent(index)

    var characterDetailed = state.characterDetailed;
    Card(
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