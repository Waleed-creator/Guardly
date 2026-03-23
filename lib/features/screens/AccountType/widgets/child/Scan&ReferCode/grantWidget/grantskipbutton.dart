import 'package:flutter/material.dart';
import 'package:mindshield/Utilities/theme/theme.dart';

class GrantSkipButton extends StatelessWidget {
  const GrantSkipButton({super.key});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TextButton(
          onPressed: () {},
          child: Text(
            "Skip>>",
            style: TextStyle(
              color: UColors.bprimary,
              fontSize: 21,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
