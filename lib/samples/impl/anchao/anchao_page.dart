import 'package:get_cli/common/utils/pubspec/pubspec_utils.dart';
import 'package:get_cli/samples/interface/sample_interface.dart';

/// [Sample] file from [app_pages] file creation.
class AnchaoAppPagesSample extends Sample {
  String initial;
  AnchaoAppPagesSample(
      {String path = 'lib/routes/app_pages.dart', this.initial = 'initial'})
      : super(path);
  final import = PubspecUtils.getPackageImport;
  String get _initialRoute =>
      initial.isNotEmpty ? '\nstatic const initial = Routes.$initial;' : '';

  @override
  String get content => '''$import
part 'app_routes.dart';

class AppPages {
   AppPages._();
  $_initialRoute

  static final pages = [
  ];
}
''';
}
