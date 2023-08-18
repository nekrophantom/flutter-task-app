import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CustomRichText extends StatelessWidget {
  final String title;
  final String textSpan;
  final VoidCallback onTap;

  const CustomRichText({
    required this.title,
    required this.textSpan,
    required this.onTap,
    super.key  
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: title,
        style: Theme.of(context).textTheme.bodyLarge,
        children: [
          TextSpan(
            text: textSpan,
            style: const TextStyle(
              color: Colors.blue,
              decoration: TextDecoration.underline
            ),
            recognizer: TapGestureRecognizer()..onTap = onTap
          )
        ]
      ),
    );
  }
}