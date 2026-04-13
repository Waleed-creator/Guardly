import 'package:flutter/material.dart';
import 'package:guardly/Utilities/constants/images.dart';

class ChartSection extends StatelessWidget {
  const ChartSection({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      margin: EdgeInsets.all(12),
      child: Center(child: Image.asset(UImages.chart)),
    );
  }
}
