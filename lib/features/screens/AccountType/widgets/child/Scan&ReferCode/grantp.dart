import 'package:flutter/material.dart';
import 'package:mindshield/Utilities/theme/theme.dart';

class GrantPermission extends StatelessWidget {
  const GrantPermission({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UColors.light,
      body: const Center(
        child: Text(
          "Hello World",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
