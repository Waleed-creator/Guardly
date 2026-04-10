import 'package:flutter/material.dart';
import 'package:mindshield/Utilities/constants/colors.dart';

class ParentStrict extends StatefulWidget {
  const ParentStrict({super.key});

  @override
  State<ParentStrict> createState() => _HomeBody();
}

class _HomeBody extends State<ParentStrict>{
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UColors.dashboard,
    ) ;
  }
}