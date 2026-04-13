import 'package:flutter/material.dart';

class AlertsList extends StatelessWidget {
  const AlertsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Icon(Icons.warning, color: Colors.red),
          title: Text("Suspicious Screenshot"),
          subtitle: Text("3:42 PM"),
        ),
        ListTile(
          leading: Icon(Icons.block),
          title: Text("App Block Attempt"),
          subtitle: Text("2:15 PM"),
        ),
      ],
    );
  }
}
