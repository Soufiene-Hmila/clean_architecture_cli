import 'dart:io';

import 'i_command.dart';

class HelpCommand implements ICommand {
  @override
  void execute() {
    stdout.writeln('Usage: clean_architecture_cli <command>\n');

    stdout.writeln('Available commands:');
    stdout.writeln('create        Create folder and file structure for Flutter Apps',);

    exit(0);

  }
}
