import 'package:craft_panel/global/globals.dart';
import 'package:craft_panel/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences storage = await SharedPreferences.getInstance();
  Globals.setExarotonClient(storage.getString("api") ?? "");
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      ),
      routerConfig: AppRouter.router,
    );
  }
}
