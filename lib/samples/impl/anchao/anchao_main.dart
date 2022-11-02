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
import 'translations/test_translations.dart';

Future<void> _reportError(FlutterErrorDetails details) async {
  if (!kReleaseMode) {
    FlutterError.presentError(details);
  } else {
    // 上传服务器
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  FlutterError.onError = (FlutterErrorDetails details) {
    _reportError(details);
  };

  PlatformDispatcher.instance.onError = (exception, stackTrace) {
    final details =
        FlutterErrorDetails(exception: exception, stack: stackTrace);
    _reportError(details);
    return true;
  };

  runApp(const ${PubspecUtils.projectName?.pascalCase}App());
}

class ${PubspecUtils.projectName?.pascalCase}App extends StatelessWidget {
  const ${PubspecUtils.projectName?.pascalCase}App({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.initial,
      defaultTransition: Transition.native,
      getPages: AppPages.pages,
      translations: ${PubspecUtils.projectName?.pascalCase}Translations(),
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('en', 'US'),
    );
  }
}
  ''';

  @override
  String get content => _flutterMain;
}
