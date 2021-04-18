import 'package:flutter/material.dart';
import 'package:nasa_picture/core/routes/route_names.dart';
import 'package:nasa_picture/feature/display_images/screen/image_detail_screen.dart';
import 'package:nasa_picture/feature/display_images/screen/image_grid_screen.dart';

class AppRoutes {
  static Route<dynamic> toRoute(RouteSettings routeSettings) {
    late Route<dynamic> route;
    String navigateToRouteName = !routeSettings.name!.contains("/")
        ? "/" + routeSettings.name!
        : routeSettings.name!;

    switch (navigateToRouteName) {
      case IMAGE_GRID_SCREEN:
        route = MaterialPageRoute(
          builder: (context) => ImageGridScreen(),
        );
        break;
      case IMAGE_DETAIL_SCREEN:
        route = MaterialPageRoute(
          builder: (context) => ImageDetailScreen(),
        );
        break;
      default:
        route = MaterialPageRoute(
          builder: (context) => ImageGridScreen(),
        );
        break;
    }
    return route;
  }
}
