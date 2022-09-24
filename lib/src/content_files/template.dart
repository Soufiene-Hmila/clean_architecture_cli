extension StringExtension on String {
  String capitalize() => isNotEmpty
          ? substring(0, 1).toUpperCase() + substring(1).toLowerCase()
          : this;
}
class Template {
  static String stateLess(String name) => '''
import 'package:flutter/material.dart';
class ${name.capitalize()} extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
''';

  static String stateFul(String name) => '''
import 'package:flutter/material.dart';
class ${name.capitalize()} extends StatefulWidget {
  const ${name.capitalize()}({super.key});
  @override
  State<${name.capitalize()}> createState() => _${name.capitalize()}State();
}
class _${name.capitalize()}State extends State<${name.capitalize()}> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
''';

  static String exporter(String name) => '''
export '${name}_bloc.dart';
export '${name}_event.dart';
export '${name}_state.dart';
''';

  static String bloc(String name) => '''
import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';
class ${name.capitalize()}Bloc extends Bloc<${name.capitalize()}Event, ${name.capitalize()}State> {
  @override
  ${name.capitalize()}State get initialState => Initial${name.capitalize()}State();
  @override
  Stream<${name.capitalize()}State> mapEventToState(
    ${name.capitalize()}Event event,
  ) async* {
    // TODO: Add Logic
  }
}
''';

  static String state(String name) => '''
import 'package:equatable/equatable.dart';
abstract class ${name.capitalize()}State extends Equatable {
  const ${name.capitalize()}State();
}
class Initial${name.capitalize()}State extends ${name.capitalize()}State {
  @override
  List<Object> get props => [];
}
''';

  static String event(String name) => '''
import 'package:equatable/equatable.dart';
abstract class ${name.capitalize()}Event extends Equatable {
  const ${name.capitalize()}Event();
}
''';


  static String abstract(String name) => '''
abstract class ${name.capitalize()} {
}
''';
}