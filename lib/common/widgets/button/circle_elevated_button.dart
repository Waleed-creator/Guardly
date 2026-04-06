import 'package:flutter/material.dart';
import 'package:mindshield/Utilities/constants/colors.dart';


class UElevatedButton extends StatelessWidget {
  const UElevatedButton({super.key, required this.onPressed, required this.child});

  final VoidCallback onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: UDeviceHelper.getScreenWidth(context),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom( backgroundColor: UColors.bprimary,
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          shape: CircleBorder(),
        ),
        child: child,
        ),
      );
  }
}
