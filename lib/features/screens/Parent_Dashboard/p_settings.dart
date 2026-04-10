import 'package:flutter/material.dart';
import 'package:mindshield/Utilities/constants/colors.dart';

class ParentSettings extends StatefulWidget {
  const ParentSettings({super.key});

  @override
  State<ParentSettings> createState() => _HomeBody();
}

class _HomeBody extends State<ParentSettings>{
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UColors.dashboard,
    ) ;
  }
}