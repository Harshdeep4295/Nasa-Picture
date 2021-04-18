import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/route_manager.dart';
import 'package:get_it/get_it.dart';
import 'package:nasa_picture/core/routes/app_routes.dart';
import 'package:nasa_picture/feature/display_images/bloc/bloc.dart';
import 'package:nasa_picture/feature/display_images/bloc/bloc_state.dart';
import 'package:nasa_picture/feature/display_images/screen/image_grid_screen.dart';

import '../bloc_test/mock_data_source.dart';
import '../bloc_test/mock_local_repository.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  ImageDisplayBloc bloc = ImageDisplayBloc(
    initialState: LoadingState(),
    repository: MockLocalRepositoryImp(
      dataSource: MockLocalDataSource(),
    ),
  );
  setUp(() {
    GetIt.instance.registerSingleton(bloc);
    Get.config(
      defaultGlobalState: true,
    );
    Get.testMode = true;
  });

  Future<void> pumpWidget(
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(GetMaterialApp(
      onGenerateRoute: (settings) => AppRoutes.toRoute(settings),
      enableLog: true,
      defaultTransition: Transition.fade,
      opaqueRoute: Get.isOpaqueRouteDefault,
      popGesture: Get.isPopGestureEnable,
      // transitionDuration: Get.defaultDurationTransition,
      defaultGlobalState: true,
    ));
    await tester.pumpAndSettle();
  }

  testWidgets("testing grid image screen", (WidgetTester tester) async {
    await pumpWidget(tester);

    final textWidgets = find.byType(Text);
    expect(textWidgets, findsOneWidget);

    final textWidget = find.text("Nasa Pictures");
    expect(textWidget, findsOneWidget);

    final heroWidget = find.byType(Hero);
    expect(heroWidget, findsNWidgets(26));

    expect(bloc.state.index, -1);

    final inkWellWidget = find.byType(InkWell);
    expect(inkWellWidget, findsNWidgets(26));

    await tester.tap(inkWellWidget.at(12));

    await tester.pumpAndSettle(Duration(seconds: 2));

    final findTextsWidgets = find.byType(Text);
    expect(findTextsWidgets, findsOneWidget);
  });
}
