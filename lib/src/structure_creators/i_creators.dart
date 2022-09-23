import 'dart:io';

abstract class ICleanArcCreator {
  Future<void> create();
}

abstract class IDirectoryCreator {
  Future<bool> createDirectories();

  Directory get configDir;

  Directory get coreDir;

  Directory get dataDir;

  Directory get domainDir;

  Directory get presentationDir;
}

abstract class IFileCreator {
  Future<void> createNecessaryFiles();
}
