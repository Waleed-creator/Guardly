import 'package:flutter/material.dart';

class CDashboard extends StatelessWidget {
  const CDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Child")),
      body: Center(child: Text("Child")),
    );
  }
}
