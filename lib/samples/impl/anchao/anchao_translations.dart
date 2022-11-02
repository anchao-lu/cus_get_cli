import 'package:get_cli/common/utils/pubspec/pubspec_utils.dart';
import 'package:get_cli/samples/interface/sample_interface.dart';
import 'package:recase/recase.dart';

/// [Sample] file from Module_View file creation.
class AnchaoTranslationsSample extends Sample {
  AnchaoTranslationsSample({bool overwrite = false})
      : super(
            'lib/translations/${PubspecUtils.projectName?.snakeCase}_translations.dart',
            overwrite: overwrite);

  String get _translations => '''import 'package:get/get.dart';

// usage: 
// Text('hello'.tr);

// Using translation with singular and plural
// var products = [];
// Text('singularKey'.trPlural('pluralKey', products.length, Args));

// Text('logged_in'.trParams({
//  'name': 'Jhon',
//  'email': 'jhon@example.com'
// }));

// var locale = Locale('en', 'US');
// Get.updateLocale(locale);
class ${PubspecUtils.projectName?.pascalCase}Translations extends Translations {
  
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': {
      'hello': 'Hello World',
      'logged_in': 'logged in as @name with email @email',
    },
    'zh_CN': {
        'hello': '你好',
        'logged_in': ' 使用@name和@email登录',
        }
    };
}

''';

  @override
  String get content => _translations;
}
