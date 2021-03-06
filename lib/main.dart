import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:nasa_picture/core/injector/injector.dart';
import 'package:nasa_picture/core/routes/app_routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xfffad200),
      ),
      onGenerateRoute: (settings) => AppRoutes.toRoute(settings),
    );
  }
}
