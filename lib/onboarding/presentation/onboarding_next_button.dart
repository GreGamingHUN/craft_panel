import 'package:flutter/material.dart';

class OnboardingNextButton extends StatelessWidget {
  const OnboardingNextButton({
    super.key,
    required this.onNext,
  });

  final void Function() onNext;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: OverflowBar(
        children: [
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
              width: 56, // Making it square
              height: 56,
              child: FilledButton(
                style: FilledButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero, // Sharp corners
                    side: BorderSide(color: Colors.black, width: 1), // Border
                  ),
                  padding: EdgeInsets.zero, // Remove default padding
                  elevation: 0, // Remove default elevation
                ),
                onPressed: () => onNext(),
                child:
                    const Icon(Icons.navigate_next), // Replace with your desired icon
              ),
            ),
          )
        ],
      ),
    );
  }
}
