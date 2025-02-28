import 'package:craft_panel/onboarding/presentation/pages/provide_api.dart';
import 'package:craft_panel/onboarding/presentation/pages/welcome.dart';
import 'package:craft_panel/routes/route_names.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  void _onNext() {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Welcome(
          onNext: _onNext,
        ),
        ProvideApi(onNext: _onNext),
        Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "We're all done!",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        spreadRadius: 1,
                        blurRadius: 0, // Sharp shadow with no blur
                        offset: const Offset(7, 7), // Diagonal offset
                      ),
                    ],
                  ),
                  child: SizedBox(
                    width: 112, // Making it square
                    height: 56,
                    child: FilledButton(
                      style: FilledButton.styleFrom(
                        backgroundColor: Colors.green,
                        side: BorderSide(color: Colors.black, width: 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero, // Sharp corners
                        ),
                        padding: EdgeInsets.zero, // Remove default padding
                        elevation: 0, // Remove default elevation
                      ),
                      onPressed: () {
                          GoRouter.of(context).pushReplacement(RouteNames.home);
                      },
                      child:
                          const Text("Start"), // Replace with your desired icon
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
