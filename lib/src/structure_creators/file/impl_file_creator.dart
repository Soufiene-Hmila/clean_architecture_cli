import 'dart:io';

import '../../content_files/template.dart';
import '../i_creators.dart';

extension FileExtention on FileSystemEntity {
  String get fileName {
    return path.split("/").last;
  }
}

class ImplFileCreator implements IFileCreator {

  final IDirectoryCreator directoryCreator;

  ImplFileCreator(this.directoryCreator);


  @override
  Future<void> createNecessaryFiles() async {
    print('creating necessary files...');

    await _createFile(
        'lib',
        'constant',
    );

    await _createFile(
      'lib',
      'home_page',
       content: Template.stateFul("homePage")
    );

    await _createFile(
        'lib',
        'injector',
        content: Template.abstract("injector")
    );

  }

  Future<void> _createFile(
      String basePath,
      String fileName, {
        String? content,
      }) async {
    try {

      final file = await File('$basePath/${fileName.toLowerCase()}.dart').create();

      if (content != null) {
        final writer = file.openWrite();
        writer.write(content);
        writer.close();
      }

    } catch (_) {

      stderr.write('creating ${fileName.toLowerCase()}.dart failed!');
      exit(2);

    }
  }
}
