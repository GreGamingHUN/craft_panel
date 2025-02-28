import 'package:craft_panel/home/presentation/home.dart';
import 'package:craft_panel/onboarding/presentation/onboarding.dart';
import 'package:craft_panel/routes/route_names.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppRouter {
  static final List<GoRoute> routes = [
    GoRoute(path: RouteNames.home, builder: (context, state) => Home()),
    GoRoute(path: RouteNames.serverList, builder: (context, state) => Home()),
    GoRoute(
        path: RouteNames.onboarding, builder: (context, state) => Onboarding()),
  ];

  static final GoRouter router = GoRouter(
    initialLocation: RouteNames.home,
    routes: routes,
    redirect: (context, state) async {
      final storage = await SharedPreferences.getInstance();
      if (storage.getString("api") == null) {
        return RouteNames.onboarding;
      }
      return null;
    },
  );
}
