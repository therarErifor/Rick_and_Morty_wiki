import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../../common/error_messages.dart';
import '../../dependencies_config.dart';
import 'character_cubit.dart';
import 'character_detailed_page_display.dart';
import 'character_state.dart';
import '../../entities/character.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CharacterPage extends StatelessWidget {
  late ScrollController _scrollController;

  CharacterBloc? _cubit;

  CharacterPage() {
    _scrollController = ScrollController()
      ..addListener(() {
        //двойная точка - это конструкция
        var extentPosition = _scrollController.position.extentAfter;

        if (extentPosition < 700) {
          _cubit?.loadNextPage();
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CharacterBloc>(
      create: (_) => container<CharacterBloc>(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.rick_and_morty_wiki),
        ),
        body: BlocBuilder<CharacterBloc, CharacterState>(
          builder: _buildBody,
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context, CharacterState state) {
    _cubit = context.read<CharacterBloc>();

    if (state is InitCharacterState) {
      return Center(
          child: SimpleDialog(backgroundColor: Colors.white, children: <Widget>[
        Column(children: [
          CircularProgressIndicator(),
          SizedBox(
            height: 10,
          ),
          Text(
            AppLocalizations.of(context)!.please_wait,
            style: TextStyle(color: Colors.blueGrey, fontSize: 18),
          )
        ]),
      ])

//        child: CircularProgressIndicator(),
          );
    }

    if (state is NetworkError) {
      return Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.signal_cellular_connected_no_internet_0_bar, size: 45),
          SizedBox(height: 20),
          Text(NoConnect().text,
              style: TextStyle(color: Colors.blueGrey, fontSize: 18)),
          SizedBox(height: 20),
          ElevatedButton(
              onPressed: () {
                _cubit?.loadNextPage();
              },
              child: Text(AppLocalizations.of(context)!.try_to_download_again))
        ],
      ));
    } else if (state is CharacterListState) {
      return Column(
        children: <Widget>[
          Expanded(
            child: _buildCharacterList(context, state.character),
            flex: 3,
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

  Widget _buildCharacterList(BuildContext context, List<Character> character) {
    return ListView.builder(
      controller: _scrollController,
      padding: const EdgeInsets.only(left: 10, right: 10),
      itemBuilder: (_, index) {
        if (index == 0) {
          return Column(children: [
            Image.asset('assets/images/header_image.png'),
          ]);
        }
        return Card(
          child: ListTile(
            contentPadding:
                EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
            leading: SizedBox(
              height: 50,
              width: 50,
              child: Image.network(character[index - 1].imageUrl,
                  errorBuilder: (context, error, stacTrace) {
                return Image.asset('assets/images/preload_image.png');
              }),
            ),
            title: Text(
                character[index - 1].id.toString() +
                    '. ' +
                    character[index - 1].name,
                style: TextStyle(color: Colors.blueGrey)),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) =>
                      CharacterDetailedPage(character[index - 1].id),
                ),
              );
            },
          ),
        );
      },
      itemCount: character.length,
    );
  }
}
