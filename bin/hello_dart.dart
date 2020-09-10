import 'package:hello_dart/hello_dart.dart' as hello_dart;
import 'package:hello_dart/iterable.dart';
import 'package:hello_dart/string.dart';

void main(List<String> arguments) {
  final ironMan = 'Tony Stark';
  final spiderMan = 'Pitter Parker';
  final hulk = 'Bruce Banner';

  /**  [codeUnitAt()]
  Returns the 16-bit UTF-16 code unit at the given [index]
  **/
  // print(ironMan.codeUnitAt(1));

  // print(ironMan.compareTo(hulk));
  // print(ironMan.compareTo(ironMan));

  print(ironMan.contains('T'));
  print(ironMan.contains('x'));

  print(ironMan.endsWith('T'));
  print(ironMan.startsWith('e'));

  print(ironMan.indexOf('d'));
}
