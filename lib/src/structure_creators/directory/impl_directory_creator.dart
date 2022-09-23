import 'dart:io';

import '../i_creators.dart';

class ImplDirectoryCreator implements IDirectoryCreator {

  final _config = 'config';
  final _routers = 'routers';
  final _themes = 'themes';


  final _core = 'core';
  final _bloc = 'bloc';
  final _params = 'params';
  final _resources = 'resources';
  final _useCase = 'use_case';
  final _utils = 'utils';


  final _data = 'data';
  final _dataSources = 'data_sources';
  final _models = 'models';
  final _repositories = 'repositories';


  final _domain = 'domain';
  final _entities = 'entities';
  final _useCases = 'use_cases';


  final _presentation = 'presentation';
  final _blocs = 'blocs';
  final _views = 'views';
  final _widgets = 'widgets';

  late final String basePath;

  @override
  Directory get configDir => Directory('$basePath/$_config');

  @override
  Directory get coreDir => Directory('$basePath/$_core');

  @override
  Directory get dataDir => Directory('$basePath/$_data');

  @override
  Directory get domainDir => Directory('$basePath/$_domain');

  @override
  Directory get presentationDir => Directory('$basePath/$_presentation');


  @override
  Future<bool> createDirectories() async {
    try {
      final libDir = Directory('lib');

      if (await libDir.exists()) {
        basePath = libDir.absolute.path;
      } else {
        final res = await Directory('lib').create(recursive: true);
        basePath = res.absolute.path;
      }

      final absConfigPath = configDir.absolute.path;
      final absCorePath = coreDir.absolute.path;
      final absDataPath = dataDir.absolute.path;
      final absDomainPath = domainDir.absolute.path;
      final absPresentationPath = presentationDir.absolute.path;

      print('creating directories...\n');

      // config directory
      print('creating config directory...');
      await Directory(absConfigPath).create();
      await Directory('$absConfigPath/$_routers').create();
      await Directory('$absConfigPath/$_themes').create();


      // core directory
      print('creating core directory...');
      await Directory(absCorePath).create();
      await Directory('$absConfigPath/$_bloc').create();
      await Directory('$absConfigPath/$_params').create();
      await Directory('$absConfigPath/$_resources').create();
      await Directory('$absConfigPath/$_useCase').create();
      await Directory('$absConfigPath/$_utils').create();


      // data directory
      print('creating data directory...');
      await Directory(absDataPath).create();
      await Directory('$absConfigPath/$_dataSources').create();
      await Directory('$absConfigPath/$_models').create();
      await Directory('$absConfigPath/$_repositories').create();


      // domain directory
      print('creating domain directory...');
      await Directory(absDomainPath).create();
      await Directory('$absConfigPath/$_entities').create();
      await Directory('$absConfigPath/$_repositories').create();
      await Directory('$absConfigPath/$_useCases').create();


      // presentation directory
      print('creating presentation directory...');
      await Directory(absPresentationPath).create();
      await Directory('$absConfigPath/$_blocs').create();
      await Directory('$absConfigPath/$_views').create();
      await Directory('$absConfigPath/$_widgets').create();


      return true;
    } catch (e, s) {
      stderr.writeln(e);
      stderr.writeln(s);
      return false;
    }
  }

}
