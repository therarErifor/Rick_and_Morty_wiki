import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_and_morty_wiki/src/dependencies_config.config.dart';

GetIt container = GetIt.instance;

@InjectableInit(initializerName: 'init', asExtension: true)
void autoConfigDependencies(String? environment) =>
    container.init(environment: environment);
