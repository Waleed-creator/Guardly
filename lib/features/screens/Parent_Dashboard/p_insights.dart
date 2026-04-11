import 'package:flutter/material.dart';
import 'package:guardly/Utilities/constants/colors.dart';

class ParentInsights extends StatefulWidget {
  const ParentInsights({super.key});

  @override
  State<ParentInsights> createState() => _HomeBody();
}

class _HomeBody extends State<ParentInsights>{
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UColors.dashboard,
    ) ;
  }
}