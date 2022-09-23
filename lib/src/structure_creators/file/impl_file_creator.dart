import 'dart:io';

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
      'injector',
      filePath: 'injector.dart'
    );

  }

  Future<void> _createFile(
    String basePath,
    String? fileName, {
    String? filePath,
  }) async {

    try {

      if(filePath != null){
        if(fileName != null) {

          final fileContent = await File('lib/content_files/$filePath').readAsString();
          final file = await File('$basePath/$fileName.dart').create();
          final writer = file.openWrite();
          writer.write(fileContent);
          writer.close();

        } else {

          final fileContent = await File('lib/content_files/$filePath').readAsString();
          final file = await File('$basePath/$filePath').create();
          final writer = file.openWrite();
          writer.write(fileContent);
          writer.close();

        }
      } else {

        if(fileName != null) {

          await File('$basePath/$fileName.dart').create();

        }

      }

    } catch (_) {
      if(fileName != null) {
        stderr.write('creating $fileName.dart failed!');
      } else {
        stderr.write('creating file failed!');
      }
      exit(2);
    }
  }
}
