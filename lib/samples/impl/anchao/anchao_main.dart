import 'package:get_cli/common/utils/pubspec/pubspec_utils.dart';
import 'package:get_cli/samples/interface/sample_interface.dart';
import 'package:recase/recase.dart';

class AnchaoMainSample extends Sample {
  AnchaoMainSample() : super('lib/main.dart', overwrite: true);

  String get _flutterMain => '''import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'routes/app_pages.dart';

Future<void> _reportError(dynamic error, dynamic stackTrace) async {
  
  if (kDebugMode) {
    // 输出到控制台...
  } else { 
    // 上传服务器
  }
}

void main() {
  FlutterError.onError = (FlutterErrorDetails details) {
    if (kDebugMode) {
      FlutterError.dumpErrorToConsole(details);
    } else {
      Zone.current.handleUncaughtError(details.exception, details.stack!);
    }
  };

  runZonedGuarded<void>(
    () => runApp(const ${PubspecUtils.projectName?.pascalCase}App()),
    _reportError,
  );
}

class ${PubspecUtils.projectName?.pascalCase}App extends StatelessWidget {
  const ${PubspecUtils.projectName?.pascalCase}App({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
      ],
      supportedLocales: const [
      ],
      initialRoute: AppPages.initial,
      defaultTransition: Transition.native,
      getPages: AppPages.pages,
    );
  }
}
  ''';

  @override
  String get content => _flutterMain;
}
