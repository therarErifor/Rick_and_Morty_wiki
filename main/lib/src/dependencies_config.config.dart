// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:rick_and_morty_wiki/src/data_source/character_data_source.dart'
    as _i3;
import 'package:rick_and_morty_wiki/src/data_source/character_remote_data_source.dart'
    as _i4;
import 'package:rick_and_morty_wiki/src/features/character_list/character_block.dart'
    as _i7;
import 'package:rick_and_morty_wiki/src/features/character_list/character_detailed_block.dart'
    as _i8;
import 'package:rick_and_morty_wiki/src/repositories/character_repository.dart'
    as _i5;
import 'package:rick_and_morty_wiki/src/repositories/character_repository_imp.dart'
    as _i6; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.CharacterDataSource>(_i4.CharacterRemoteDataSource());
    gh.singleton<_i5.CharacterRepository>(
        _i6.CharacterRepositoryImp(gh<_i3.CharacterDataSource>()));
    gh.factory<_i7.CharacterBloc>(
        () => _i7.CharacterBloc(gh<_i5.CharacterRepository>()));
    gh.factoryParam<_i8.CharacterDetailedBloc, int, dynamic>((
      id,
      _,
    ) =>
        _i8.CharacterDetailedBloc(
          gh<_i5.CharacterRepository>(),
          id,
        ));
    return this;
  }
}
