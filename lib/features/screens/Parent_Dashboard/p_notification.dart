import 'package:flutter/material.dart';
import 'package:mindshield/Utilities/constants/colors.dart';

class ParentNotification extends StatefulWidget {
  const ParentNotification({super.key});

  @override
  State<ParentNotification> createState() => _HomeBody();
}

class _HomeBody extends State<ParentNotification>{
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UColors.dashboard,
    ) ;
  }
}