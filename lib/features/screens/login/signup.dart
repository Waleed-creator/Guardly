import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:guardly/Utilities/constants/images.dart';
import 'package:guardly/Utilities/constants/texts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:guardly/Utilities/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:guardly/features/screens/login/login.dart';
import 'package:guardly/Utilities/theme/theme.dart';
import '../../../common/widgets/button/u_elevated_button.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  // Body code
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomRight,
            colors: [UColors.primary_600, UColors.secondary],
            stops: [0.1, 0.6],
          ),
        ),
        child: Stack(
          children: [
            PageView(
              children: [
                SignupPage(image: UImages.loginSplash, title: UTexts.signUp),
              ],
            ),
            Positioned(
              top: USizes.spaceBtwItems * 4.6,
              left: 10,
              child: UElevatedButton.svgOnly(
                onPressed: () => Get.back(),
                child: SvgPicture.asset(
                  UImages.backward,
                  width: 34,
                  height: 34,
                  colorFilter: const ColorFilter.mode(
                    UColors.secondaryBlack,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// StatelessWidget se StatefulWidget mein convert kiya
class SignupPage extends StatefulWidget {
  const SignupPage({super.key, required this.image, required this.title});
  final String image;
  final String title;

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  // ✅ Controllers
  final TextEditingController fnamecontroller = TextEditingController();
  final TextEditingController lnamecontroller = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final TextEditingController cpasswordcontroller = TextEditingController();

  bool hidePassword = true;
  bool hideConfirmPassword = true;

  // ✅ REGISTRATION FUNCTION
  Future<void> registration() async {
    String fname = fnamecontroller.text.trim();
    String lname = lnamecontroller.text.trim();
    String email = emailcontroller.text.trim();
    String password = passwordcontroller.text.trim();
    String cpassword = cpasswordcontroller.text.trim();

    if (fname.isEmpty ||
        lname.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        cpassword.isEmpty) {
      Get.snackbar("Error", "All fields are required");
      return;
    }

    if (password != cpassword) {
      Get.snackbar("Error", "Passwords do not match");
      return;
    }

    try {
      // ✅ SIRF EK BAAR call karo
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      // ✅ First name Firebase mein save karo
      await userCredential.user?.updateDisplayName(fname);

      Get.snackbar("Success", "Registered Successfully");

      // ✅ Login screen pe jao (arguments mat do yahan)
      Get.to(() => LoginScreen());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.snackbar("Error", "Weak Password");
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar("Error", "Email already exists");
      } else {
        Get.snackbar("Error", e.message ?? "Signup Failed");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: USizes.defaultSpace,
        left: USizes.defaultSpace,
        top: 85,
      ),
      child: Column(
        children: [
          /***************
           * HEADER PART *
           ***************/
          Center(
            child: SizedBox(
              height: 90,
              width: 90,
              child: Image.asset(widget.image, fit: BoxFit.contain),
            ),
          ),

          const SizedBox(height: 5),

          Text(
            widget.title,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 10),

          /***************
           * FORM PART   *
           ***************/

          // 👤 FIRST + LAST NAME
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: fnamecontroller,
                  decoration: const InputDecoration(
                    labelText: "First Name",
                    filled: true,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: TextFormField(
                  controller: lnamecontroller,
                  decoration: const InputDecoration(
                    labelText: "Last Name",
                    filled: true,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          // 📧 EMAIL
          TextFormField(
            controller: emailcontroller,
            decoration: const InputDecoration(labelText: "Email", filled: true),
          ),

          SizedBox(height: USizes.spaceBtwInputFields),

          // 🔒 PASSWORD
          TextFormField(
            controller: passwordcontroller,
            obscureText: hidePassword,
            decoration: InputDecoration(
              labelText: "Password",
              filled: true,
              suffixIcon: IconButton(
                icon: Icon(hidePassword ? Iconsax.eye_slash : Iconsax.eye),
                onPressed: () {
                  setState(() {
                    hidePassword = !hidePassword;
                  });
                },
              ),
            ),
          ),

          SizedBox(height: USizes.spaceBtwInputFields),

          // 🔒 CONFIRM PASSWORD
          TextFormField(
            controller: cpasswordcontroller,
            obscureText: hideConfirmPassword,
            decoration: InputDecoration(
              labelText: "Confirm Password",
              filled: true,
              suffixIcon: IconButton(
                icon: Icon(
                  hideConfirmPassword ? Iconsax.eye_slash : Iconsax.eye,
                ),
                onPressed: () {
                  setState(() {
                    hideConfirmPassword = !hideConfirmPassword;
                  });
                },
              ),
            ),
          ),

          const SizedBox(height: 10),

          //  Continue BUTTON
          UElevatedButton.rectangle(
            onPressed: registration, // dialog open hoga
            text: UTexts.continueButton,
            backgroundColor: UColors.bprimary,
            elevation: 0,
            horizontalMargin: 0,
          ),

          SizedBox(height: USizes.spaceBtwItems / 2),

          /***************
           * DIVIDER PART *
           ***************/
          const SizedBox(height: 10),

          Row(
            children: [
              const Expanded(
                child: Divider(indent: 10, endIndent: 5, thickness: 0.5),
              ),
              Text(
                UTexts.orSignInWith,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const Expanded(
                child: Divider(indent: 5, endIndent: 10, thickness: 0.5),
              ),
            ],
          ),

          const SizedBox(height: 0),

          Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 24,
                  width: 24,
                  child: Image.asset(UImages.google),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    UTexts.cWAccount, // ignore: undefined_identifier
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 17,
                    ),
                  ),
                ),
              ],
            ),
          ),

          Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  UTexts.alreadyHaveAccount,
                  style: const TextStyle().copyWith(
                    fontWeight: FontWeight.normal,
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 16,
                  ),
                ),
                TextButton(
                  onPressed: () => Get.to(() => LoginScreen()),
                  child: const Text(
                    UTexts.signIn,
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Color(0xFF009688),
                      fontSize: 17,
                      decoration: TextDecoration.underline,
                      decorationThickness: 2,
                      decorationColor: Color(0xFF009688),
                    ),
                  ),
                ),
              ],
            ),
          ),

          /***************
           * FOOTER PART *
           ***************/
        ],
      ),
    );
  }
}


    // onPressed: _showConfirmDialog, // dialog open hoga


//  // ✅ Popup dialog function
//   void _showConfirmDialog() {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//         title: const Row(
//           children: [
//             Icon(Icons.info_outline, color: Colors.teal),
//             SizedBox(width: 8),
//             Text("Confirm"),
//           ],
//         ),
//         content: const Text("Kya aap Login page par jana chahte hain?"),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: const Text("Nahi", style: TextStyle(color: Colors.grey)),
//           ),
//           ElevatedButton(
//             style: ElevatedButton.styleFrom(
//               backgroundColor: UColors.bprimary,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(8),
//               ),
//             ),
//             onPressed: () {
//               Navigator.pop(context);
//               Get.to(() => LoginScreen());
//             },
//             child: const Text("Haan", style: TextStyle(color: Colors.white)),
//           ),
//         ],
//       ),
//     );
//   }

//   // ******************************************  Pop Up Code
