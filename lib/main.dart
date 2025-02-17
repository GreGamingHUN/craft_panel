import 'package:craft_panel/server_list/presentation/server_list.dart';
import 'package:exaroton_api/exaroton_api.dart';
import 'package:flutter/material.dart';

void main() async {
  final client = ExarotonClient("01s3PJT7pNnFrqvTviT7S4xKm1LqWAfY3MLHjKc4pHwocayfRxw4J1JYgM65cTwM8UlYBXbi1W9QFu8D2btDiZIVCy9ygd4LZZDk");
  final account = await client.accountService.getAccount();
  print(account.toString());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ServerList(),
    );
  }
}