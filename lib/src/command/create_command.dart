import '../impl_clean_arc_creator.dart';
import '../structure_creators/directory/impl_directory_creator.dart';
import '../structure_creators/file/impl_file_creator.dart';
import 'i_command.dart';

class CreateCommand implements ICommand {
  @override
  Future<void> execute() async {
    final directoryCreator = ImplDirectoryCreator();
    final fileCreator = ImplFileCreator(directoryCreator);

    final cleanArcCreator = ImplCleanArchitectureCreator(
      directoryCreator: directoryCreator,
      fileCreator: fileCreator,
    );

    return cleanArcCreator.create();
  }
}
