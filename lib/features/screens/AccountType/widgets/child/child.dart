import 'package:flutter/material.dart';

class ChildScreen extends StatelessWidget {
  const ChildScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Child Screen',
          style: TextStyle(fontSize: 32, color: Colors.black),
        ),
      ),
    );
  }
}
