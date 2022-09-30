import 'dart:io';

import 'package:get_cli/common/utils/logger/log_utils.dart';
import 'package:get_cli/common/utils/pubspec/pubspec_utils.dart';
import 'package:get_cli/core/internationalization.dart';
import 'package:get_cli/core/locales.g.dart';
import 'package:get_cli/extensions/string.dart';
import 'package:get_cli/functions/create/create_single_file.dart';
import 'package:get_cli/functions/find_file/find_file_by_name.dart';
import 'package:get_cli/functions/formatter_dart_file/frommatter_dart_file.dart';
import 'package:get_cli/functions/routes/anchao_add_page.dart';
import 'package:get_cli/samples/impl/anchao/anchao_route.dart';
import 'package:recase/recase.dart';

/// This command will create the route to the new page
void anchaoAddRoute(String nameRoute, String viewDir) {
  var routesFile = findFileByName('app_routes.dart');
  //var lines = <String>[];
  var content = '';

  if (routesFile.path.isEmpty) {
    AnchaoAppRouteSample().create();
    routesFile = File(AnchaoAppRouteSample().path);
    content = routesFile.readAsStringSync();
  } else {
    content = formatterDartFile(routesFile.readAsStringSync());
  }

  var declareRoute = 'static const ${nameRoute.snakeCase.toUpperCase()} =';
  var line = "$declareRoute '/${nameRoute.snakeCase}';";

  final newPath = line;

  // 新的 path 才需要添加
  if (!content.contains(newPath)) {
    anchaoAddPage(nameRoute, viewDir);
  }

  if (!content.contains(newPath)) {
    content = content.appendClassContent('_Paths', line);
  }

  final newRoute = "$declareRoute _Paths.${nameRoute.snakeCase.toUpperCase()};";
  if (!content.contains(newRoute)) {
    content = content.appendClassContent(
        'Routes', "$declareRoute _Paths.${nameRoute.snakeCase.toUpperCase()};");
  }

  LogService.success(
      Translation(LocaleKeys.sucess_route_created).trArgs([nameRoute]));

  writeFile(
    routesFile.path,
    content,
    overwrite: true,
    logger: false,
    useRelativeImport: true,
  );
}
