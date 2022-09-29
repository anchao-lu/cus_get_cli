import 'dart:io';

import '../../../../common/utils/logger/log_utils.dart';
import '../../../../common/utils/pubspec/pubspec_utils.dart';
import '../../../../core/internationalization.dart';
import '../../../../core/locales.g.dart';
import '../../../../core/structure.dart';
import '../../../../functions/create/create_list_directory.dart';
import '../../../../functions/create/create_main.dart';
import '../../../../samples/impl/getx_pattern/get_main.dart';
import '../../commads_export.dart';
import '../../install/install_get.dart';

Future<void> createInitAnchaoProvider() async {
  var canContinue = await createMain();
  if (!canContinue) return;

  var isServerProject = PubspecUtils.isServerProject;
  if (isServerProject) {
    print('anchaolu do not support server project.');
    return;
  }

  await installGet();

  var initialDirs = [
    Directory(Structure.replaceAsExpected(path: 'lib/app/data/')),
  ];

  GetXMainSample(isServer: false).create();

  await Future.wait([
    CreatePageCommand().execute(),
  ]);

  createListDirectory(initialDirs);

  LogService.success(Translation(LocaleKeys.sucess_getx_pattern_generated));
}
