import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:who_are_you/config/navigation/main_shell_screen.dart';
import 'package:who_are_you/config/navigation/routes.dart';
import 'package:who_are_you/presentation/screens/face_compare_screen.dart';
import 'package:who_are_you/presentation/screens/face_detection_screen.dart';

class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _shellNavigatorKey = GlobalKey<StatefulNavigationShellState>();

  static GoRouter routerConfig() {
    return GoRouter(
      navigatorKey: _rootNavigatorKey,
      initialLocation: AppRoutes.faceAttributes.path,
      routes: [
        StatefulShellRoute.indexedStack(
          parentNavigatorKey: _rootNavigatorKey,
          key: _shellNavigatorKey,
          builder: (context, state, navigationShell) => MainShellScreen(
            navigationShell,
          ),
          branches: [
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: AppRoutes.faceAttributes.path,
                  name: AppRoutes.faceAttributes.name,
                  builder: (context, state) => const FaceDetectionScreen(),
                ),
              ],
            ),
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: AppRoutes.twoFaces.path,
                  name: AppRoutes.twoFaces.name,
                  builder: (context, state) => const FaceCompareScreen(),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
