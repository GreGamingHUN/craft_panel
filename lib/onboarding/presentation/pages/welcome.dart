import 'package:craft_panel/onboarding/presentation/onboarding_next_button.dart';
import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  final void Function() onNext;

  const Welcome({super.key, required this.onNext});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: OnboardingNextButton(onNext: onNext),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Welcome to CraftPanel!',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "At the moment the app only supports Exaroton servers, but we're working on adding more providers!",
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
