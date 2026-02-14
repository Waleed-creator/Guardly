import 'package:flutter/material.dart';

class ParentScreen extends StatelessWidget {
  const ParentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Parent Screen',
          style: TextStyle(fontSize: 32, color: Colors.black),
        ),
      ),
    );
  }
}
