import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty_wiki/source/data_source/character_remote_dara_source.dart';
import 'package:rick_and_morty_wiki/source/repositories/character_repository_imp.dart';
import 'character_block.dart';
import 'character_events.dart';
import 'character_state.dart';

class CharacterPage extends StatelessWidget {
  const CharacterPage();

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
          builder: _BuildCharacterList,
        ),
      ),
    );
  }
}

Widget _BuildCharacterList(BuildContext context, CharacterState state) {
  if (state is InitState) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
  if (state is CharacterLoadState) {
    var character = state.character;
    //return ListView.builder(itemBuilder: (_, index ) => ListTile(title: Text(),))

    return ListView.builder(
      padding: EdgeInsets.only(left: 10, right: 10),
      itemBuilder: (_, index) => Card(
        child: ListTile(
          contentPadding:
              EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
          leading: Image.network(character[index].imageUrl),
          title: Text(
            character[index].name,
            //overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
      itemCount: character.length,
    );
  }

  return SizedBox.shrink();
}
