import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
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
        route = GetPageRoute(
          page: () => ImageGridScreen(),
        );
        break;
      case IMAGE_DETAIL_SCREEN:
        route = GetPageRoute(
          page: () => ImageDetailScreen(
            index: (routeSettings.arguments as Map)["index"],
          ),
        );
        break;
      default:
        route = GetPageRoute(
          page: () => ImageGridScreen(),
        );
        break;
    }
    return route;
  }
}
