import 'package:flutter/material.dart';




class UForgotElevatedButton extends StatelessWidget {
  const UForgotElevatedButton({
    super.key,
    required this.onPressed,
    required this.child,
  });

  
  
  final VoidCallback onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: UDeviceHelper.getScreenWidth(context),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor:  const Color.fromARGB(207, 255, 255, 255),
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          shape: CircleBorder(),
        ),
        child: child,
      ),
    );
  }
}
