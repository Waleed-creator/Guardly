import 'package:flutter/material.dart';
import 'package:guardly/Utilities/constants/colors.dart';

class ParentHome extends StatefulWidget {
  const ParentHome({super.key});

  @override
  State<ParentHome> createState() => _HomeBody();
}

class _HomeBody extends State<ParentHome>{
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UColors.dashboard,
    ) ;
  }
}