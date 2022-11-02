import 'package:get_cli/samples/interface/sample_interface.dart';
import 'package:recase/recase.dart';

/// [Sample] file from Module_View file creation.
class AnchaoScreenSample extends Sample {
  final String _fileName;

  AnchaoScreenSample(String path, this._fileName, {bool overwrite = false})
      : super(path, overwrite: overwrite);

  String get _controllerName => 'GetView<${_fileName.pascalCase}Controller>';

  String get _flutterView => '''import 'package:flutter/material.dart';

import 'package:get/get.dart';

part '${_fileName}_controller.dart';
part '${_fileName}_binding.dart';

class ${_fileName.pascalCase}Screen extends $_controllerName {
  const ${_fileName.pascalCase}Screen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

  ''';

  @override
  String get content => _flutterView;
}
