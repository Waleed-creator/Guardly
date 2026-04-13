import 'package:flutter/material.dart';

class DeviceCard extends StatelessWidget {
  const DeviceCard({super.key});
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(12),
      child: ListTile(
        leading: Icon(Icons.phone_iphone),
        title: Text("iPhone 13"),
        subtitle: Text("2 mins ago"),
      ),
    );
  }
}
