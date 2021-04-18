import 'package:get/route_manager.dart';

class Routing {
  static void navigateTo(String screenName, [Map<String, dynamic>? arguments]) {
    Get.toNamed(screenName, arguments: arguments);
  }
}
