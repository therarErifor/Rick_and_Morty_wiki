import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../common/error_messages.dart';
import '../../dependencies_config.dart';
import 'character_detailed_cubit.dart';

import 'character_detailed_state.dart';

class CharacterDetailedPage extends StatelessWidget {
  final int _id;

  CharacterDetailedPage(int id) : _id = id {}

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CharacterDetailedBloc>(
      create: (_) => container<CharacterDetailedBloc>(param1: _id),
      // create: (_) => CharacterDetailedBloc(
      //     CharacterRepositoryImp(CharacterRemoteDataSource()), _id),
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.about_the_character),
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
    if (state is DetailedNetworkError) {
      return Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.signal_cellular_connected_no_internet_0_bar, size: 45),
          SizedBox(height: 20),
          Text(NoConnect().text,
              style: TextStyle(color: Colors.blueGrey, fontSize: 18)),
          SizedBox(height: 20),
        ],
      ));
    } else if (state is CharacterDetailedLoadState) {
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
                    Text(AppLocalizations.of(context)!.name),
                    Container(
                      width: 300,
                      child: Text(characterDetailed.name,
                          style:
                              TextStyle(fontSize: 22, color: Colors.blueGrey),
                          softWrap: true),
                    ),
                    SizedBox(height: 15),
                    Text(AppLocalizations.of(context)!.status),
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
                    Text(AppLocalizations.of(context)!.gender),
                    Text(characterDetailed.gender,
                        style: TextStyle(fontSize: 22, color: Colors.blueGrey)),
                    SizedBox(height: 15),
                    Text(AppLocalizations.of(context)!.last_known_location),
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
