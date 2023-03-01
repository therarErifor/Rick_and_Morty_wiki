import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_and_morty_wiki/src/data_source/character_data_source.dart';
import 'package:rick_and_morty_wiki/src/data_source/character_remote_data_source.dart';
import 'package:rick_and_morty_wiki/src/dependencies_config.config.dart';
import 'package:rick_and_morty_wiki/src/entities/character_detailed.dart';
import 'package:rick_and_morty_wiki/src/repositories/character_repository.dart';
import 'package:rick_and_morty_wiki/src/repositories/character_repository_imp.dart';

import 'features/character_list/character_block.dart';
import 'features/character_list/character_detailed_block.dart';

GetIt container = GetIt.instance;

// void configureDependencies() {
//   container.registerSingleton<CharacterRepository>(
//       CharacterRepositoryImp(container<CharacterDataSource>()));
//   container.registerSingleton<CharacterDataSource>(CharacterRemoteDataSource());
//   container.registerFactory<CharacterBloc>(
//       () => CharacterBloc(container<CharacterRepository>()));
//
//   container.registerFactory<CharacterDetailedBloc>(
//       () => CharacterDetailedBloc(container<CharacterRepository>(), 1));
// }

@InjectableInit(initializerName: 'init', asExtension: true)
void autoConfigDependencies(String? environment) =>
    container.init(environment: environment);

