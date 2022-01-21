import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:image_search/di/dependency_binding.dart';
import 'package:image_search/ui/detail/detail_view.dart';
import 'package:image_search/ui/list/list_view.dart';
import 'package:logger/logger.dart';

var logger = Logger(
  printer: PrettyPrinter(
    methodCount: 2,
    errorMethodCount: 12,
    lineLength: 120,
    colors: true,
    printEmojis: true,
    printTime: false
  ),
  level: kDebugMode ? Level.debug : Level.nothing
);

void main() {
  runApp(const ImageSearchApp());
}

class ImageSearchApp extends StatelessWidget {
  const ImageSearchApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      routes: {
        DetailScreen.routeName : (context) => DetailScreen(),
        },
      home: ListScreen(),
      initialBinding: DefaultDependencyBinding(),
    );
  }
}


