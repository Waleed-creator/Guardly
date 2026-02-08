import 'package:flutter/material.dart';
import 'package:mindshield/Utilities/constants/sizes.dart';



class AccontBody extends StatelessWidget {

  const AccontBody({super.key, required this.hTitle});
  final String hTitle;

  // final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: USizes.defaultSpace,
        left: USizes.defaultSpace,
        // top: UDeviceHelper.getAppBarHeight(),
        top: 160,
      ),
      child: Column(
        children: [
          //  Header Text
          Text(
            hTitle,
            style: TextStyle().copyWith(
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          // For parent & For Child
        ],
      ),
    );
  }
}





