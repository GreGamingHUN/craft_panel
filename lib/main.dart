
import 'package:craft_panel/routes/app_router.dart';
import 'package:flutter/material.dart';

final String serverId = "AgYIAvkAcivEXEev";

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Craft Panel',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: AppRouter.router
    );
  }
}