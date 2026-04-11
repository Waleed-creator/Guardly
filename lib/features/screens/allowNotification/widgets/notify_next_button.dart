import 'package:flutter/material.dart';
import 'package:guardly/Utilities/constants/sizes.dart';
import 'package:guardly/common/widgets/button/u_elevated_button.dart';
import 'package:guardly/features/screens/login/login_splash.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:guardly/Utilities/constants/colors.dart';

class NotifyNextButton extends StatelessWidget {
  const NotifyNextButton({super.key});

  Future<void> _handleNotificationPermission() async {
    // Request notification permission
    PermissionStatus status = await Permission.notification.request();

    if (status.isGranted) {
      Fluttertoast.showToast(
        msg: "Notifications Allowed",
        toastLength: Toast.LENGTH_SHORT,
      );
    } else if (status.isDenied) {
      Fluttertoast.showToast(
        msg: "Notifications Denied",
        toastLength: Toast.LENGTH_SHORT,
      );
    } else if (status.isPermanentlyDenied) {
      Fluttertoast.showToast(
        msg: "Permission permanently denied",
        toastLength: Toast.LENGTH_SHORT,
      );
      await openAppSettings();
    }

    // 👇 Navigate to Login in ALL cases
    Get.offAll(() => const LoginSplashScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        // Yahan margin define kar sakte ho
        margin: EdgeInsets.symmetric(
          horizontal: USizes.spaceBtwItems,
          vertical: 30,
        ),
        padding: EdgeInsets.only(
          bottom: USizes.spaceBtwItems,
        ), // existing padding
        child: UElevatedButton.rectangle(
          onPressed: _handleNotificationPermission,
          text: "Next",
          backgroundColor: UColors.bprimary,
          horizontalMargin: 0,
        ),
      ),
    );
  }
}

// class NotifyNextButton extends StatelessWidget {
//   const NotifyNextButton({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Align(
//       alignment: Alignment.bottomCenter,
//       child: Padding(
//         padding: EdgeInsets.only(bottom: USizes.spaceBtwItems * 3),
//         child: UFElevatedButton(
//           onPressed: () {
//             // 👇 Move directly to Login screen
//             Get.to(() => const LoginScreen());
//           },
//           child: const Text(
//             "Next",
//             style: TextStyle(
//               color: Colors.white,
//               fontWeight: FontWeight.bold,
//               fontSize: 18,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
