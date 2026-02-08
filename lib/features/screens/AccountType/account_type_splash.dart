import 'package:flutter/material.dart';
import 'package:mindshield/Utilities/constants/texts.dart';
import 'package:mindshield/common/widgets/button/rounded_rectangle_forward_elevated_button.dart';
import 'package:mindshield/features/screens/AccountType/widgets/acount_helper.dart';
import 'package:mindshield/features/screens/forgotpassword/widgets/forgotbackbutton.dart';
// import 'package:mindshield/Utilities/constants/sizes.dart';
// import 'package:mindshield/Utilities/constants/images.dart';


// /*************************
//  * //   MAIN BRAIN CLASS *
//  *************************/

class ChooseAccount extends StatefulWidget {
  const ChooseAccount({super.key});

  @override
  State<ChooseAccount> createState() => _ChooseAccountState();
}

// /*************************
//  * //   State BodyCLASS *
//  *************************/

enum UserType { parent, child }

class _ChooseAccountState extends State<ChooseAccount> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(children: [AccontBody(hTitle: UTexts.accountTypeTitle)]),

          //  Backward Button
          ForgotBackButton(),
          //  Continue Button
          Positioned(
            bottom: 25,
            left: 15,
            right: 15,
            child: UElevatedButton(
              onPressed: () {},
              child: Text(UTexts.continueButton),
            ),
          ),
        ],
      ),
    );
  }
}

































































// enum UserType { parent, child }

// class ChooseAccount extends StatefulWidget {
//   const ChooseAccount({super.key});

//   @override
//   
// }

// class _ChooseAccountState extends State<ChooseAccount> {
//   UserType? selectedUser; // 🔥 STATE YAHAN RAKHNA HAI

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(20),
//           child: Column(
//             children: [
//               const SizedBox(height: 60),

//               const Text(
//                 "Who is going to use this device?",
//                 textAlign: TextAlign.center,
//                 style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
//               ),

//               const SizedBox(height: 30),

//               buildUserCard(
//                 type: UserType.parent,
//                 title: "Parent",
//                 subtitle: "I will use it to manage my childs device.",
//                 image: UImages.parent1, // apna path lagao
//               ),

//               const SizedBox(height: 16),

//               buildUserCard(
//                 type: UserType.child,
//                 title: "Child",
//                 subtitle: "I will monitor this device.",
//                 image: UImages.child1,
//               ),

//               const Spacer(),

//               SizedBox(
//                 width: double.infinity,
//                 child: ElevatedButton(
//                   onPressed: selectedUser == null ? null : () {},
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.teal,
//                     padding: const EdgeInsets.symmetric(vertical: 16),
//                   ),
//                   child: const Text("Continue"),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   // 🔥 CARD WIDGET
//   Widget buildUserCard({
//     required UserType type,
//     required String title,
//     required String subtitle,
//     required String image,
//   }) {
//     bool isSelected = selectedUser == type;

//     return GestureDetector(
//       onTap: () {
//         setState(() {
//           selectedUser = type;
//         });
//       },
//       child: AnimatedContainer(
//         duration: const Duration(milliseconds: 300),
//         padding: const EdgeInsets.all(16),
//         decoration: BoxDecoration(
//           color: isSelected ? Colors.teal : Colors.white,
//           borderRadius: BorderRadius.circular(16),
//           border: Border.all(color: Colors.grey.shade300),
//           boxShadow: const [
//             BoxShadow(color: Colors.black12, blurRadius: 6)
//           ],
//         ),
//         child: Column(
//           children: [
//             if (isSelected)
//               Padding(
//                 padding: const EdgeInsets.only(bottom: 12),
//                 child: Image.asset(image, height: 120),
//               ),

//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       title,
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                         color: isSelected ? Colors.white : Colors.black,
//                       ),
//                     ),
//                     const SizedBox(height: 4),
//                     Text(
//                       subtitle,
//                       style: TextStyle(
//                         fontSize: 12,
//                         color:
//                             isSelected ? Colors.white70 : Colors.black54,
//                       ),
//                     ),
//                   ],
//                 ),
//                 Icon(
//                   isSelected
//                       ? Icons.radio_button_checked
//                       : Icons.radio_button_off,
//                   color: isSelected ? Colors.white : Colors.grey,
//                 )
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

