import 'package:flutter/material.dart';

class PDashboard extends StatelessWidget {
  const PDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Parent")),
      body: Center(child: Text("Parent")),
    );
  }
}
