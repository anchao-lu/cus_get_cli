import 'package:get_cli/samples/interface/sample_interface.dart';
import 'package:recase/recase.dart';

/// [Sample] file from Module_Controller file creation.
class AnchaoControllerSample extends Sample {
  final String _fileName;
  AnchaoControllerSample(
    String path,
    this._fileName, {
    bool overwrite = false,
  }) : super(path, overwrite: overwrite);

  @override
  String get content => flutterController;

  String get flutterController => '''part of '${_fileName}_screen.dart';

class ${_fileName.pascalCase}Controller extends GetxController {
}

''';
}
