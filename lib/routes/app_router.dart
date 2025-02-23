import 'package:craft_panel/onboarding/presentation/onboarding.dart';
import 'package:craft_panel/routes/route_names.dart';
import 'package:craft_panel/server_list/presentation/server_list.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final List<GoRoute> routes = [
    //GoRoute(path: RouteNames.home, pageBuilder: (context, state) => ),
    GoRoute(
      path: RouteNames.onboarding,
      builder: (context, state) => Onboarding(),
    ),
    GoRoute(
      path: RouteNames.serverList,
      builder: (context, state) => ServerList(),
    ),
  ];

  static final GoRouter router = GoRouter(
    initialLocation: RouteNames.onboarding,
    redirect: (context, state) async {
      return RouteNames.onboarding;
      //return RouteNames.serverList;
    },
    routes: routes,
  );
}
