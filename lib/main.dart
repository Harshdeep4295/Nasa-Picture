import 'package:flutter/material.dart';
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
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: (settings) => AppRoutes.toRoute(settings),
    );
  }
}
