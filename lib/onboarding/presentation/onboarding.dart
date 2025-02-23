import 'package:craft_panel/server_list/presentation/server_list.dart';
import 'package:flutter/material.dart';

class Onboarding extends StatelessWidget {
  Onboarding({super.key});
  final apiKeyController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text("give api key"),
            TextField(
              controller: apiKeyController,
            ),
            FilledButton(
                onPressed: () async {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ServerList()));
                },
                child: Text("go")),
          ],
        ),
      ),
    );
  }
}
