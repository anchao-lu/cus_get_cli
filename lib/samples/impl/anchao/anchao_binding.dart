import 'package:get_cli/samples/interface/sample_interface.dart';
import 'package:recase/recase.dart';

/// [Sample] file from Module_Binding file creation.
class AnchaoBindingSample extends Sample {
  final String _fileName;

  AnchaoBindingSample(
    String path,
    this._fileName, {
    bool overwrite = false,
  }) : super(path, overwrite: overwrite);

  String get _import => "part of '${_fileName}_screen.dart';";

  @override
  String get content => '''$_import

class ${_fileName.pascalCase}Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<${_fileName.pascalCase}Controller>(
      () => ${_fileName.pascalCase}Controller(),
    );
  }
}

''';
}
