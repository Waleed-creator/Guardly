import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:guardly/Utilities/constants/images.dart';
import 'package:guardly/Utilities/constants/sizes.dart';
import 'package:guardly/Utilities/constants/texts.dart';
import 'package:get/get.dart';
import 'package:guardly/features/screens/forgotpassword/forgotpass.dart';
import 'package:guardly/features/screens/login/signup.dart';
import 'package:guardly/Utilities/theme/theme.dart';
import 'package:guardly/features/screens/login/welcome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../common/widgets/button/u_elevated_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.image, required this.title});

  final String image;
  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Controller
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool rememberMe = false;
  bool hidePassword = true;

  Future<void> loginUser() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      Get.snackbar("Error", "Email & Password required");
      return;
    }

    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      // Firebase se display name fetch karo
      String firstName = userCredential.user?.displayName ?? "User";

      Get.to(() => const WellcomeScreen(), arguments: firstName);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar("Error", "No user found with this email");
      } else if (e.code == 'wrong-password') {
        Get.snackbar("Error", "Wrong password");
      } else {
        Get.snackbar("Error", e.message ?? "Login Failed");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: USizes.defaultSpace,
        left: USizes.defaultSpace,
        // top: UDeviceHelper.getAppBarHeight(),
        top: 80,
      ),
      child: Column(
        children: [
          /***************
          * HEADER PART *
           ***************/
          // ! Image
          Center(
            child: SizedBox(
              height: 110,
              width: 90, // image height adjust karo yahan
              child: Image.asset(widget.image, fit: BoxFit.contain),
            ),
          ),

          const SizedBox(height: 5),
          // !  Title
          Text(
            widget.title,
            style: Theme.of(context).textTheme.headlineLarge,
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 20),
          /***************
          * FORM PART *
           ***************/

          // 📧 EMAIL
          TextFormField(
            controller: emailController,
            decoration: InputDecoration(
              labelText: UTexts.email,
              hintText: "Enter your email",
              filled: true,
              fillColor: UColors.light,
            ),
          ),

          SizedBox(height: USizes.spaceBtwInputFields),

          // 🔒 PASSWORD
          TextFormField(
            controller: passwordController,
            obscureText: hidePassword,
            decoration: InputDecoration(
              labelText: UTexts.password,
              hintText: "Enter your Password",
              filled: true,
              fillColor: UColors.light,
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

          // ✔ REMEMBER + FORGOT
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Checkbox(
                    value: rememberMe,
                    onChanged: (value) {
                      setState(() {
                        rememberMe = value ?? false;
                      });
                    },
                  ),
                  Text(UTexts.rememberMe),
                ],
              ),

              TextButton(
                onPressed: () => Get.to(() => const ForgotMainScreen()),
                child: Text(
                  UTexts.forgetPassword,
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: UColors.bprimary,
                    fontSize: 13,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 10),

          // SignIn
          // 🔥 LOGIN BUTTON
          UElevatedButton.rectangle(
            onPressed: loginUser,
            text: UTexts.logIn,
            backgroundColor: UColors.bprimary,
            elevation: 2,
            horizontalMargin: 0,
          ),

          SizedBox(height: USizes.spaceBtwItems / 2),
          // Create Account Button

          /***************
          * DIVIDER PART *
           ***************/
          SizedBox(height: 10),

          Row(
            children: [
              Expanded(
                child: Divider(indent: 10, endIndent: 5, thickness: 0.5),
              ),
              Text(
                UTexts.orSignInWith,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              Expanded(
                child: Divider(indent: 5, endIndent: 10, thickness: 0.5),
              ),
            ],
          ),

          SizedBox(height: 10),

          Center(
            child: Row(
              mainAxisSize: MainAxisSize
                  .min, // [icon][text]__________________________________ Space So Instaed Of max We use Min
              children: [
                SizedBox(
                  height: 24,
                  width: 24,
                  child: Image.asset(UImages.google),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    UTexts.cWAccount,
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
              mainAxisSize: MainAxisSize
                  .min, // [icon][text]__________________________________ Space So Instaed Of max We use Min
              children: [
                Text(
                  UTexts.cWOAccount,
                  style: TextStyle().copyWith(
                    fontWeight: FontWeight.normal,
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 16,
                  ),
                ),

                TextButton(
                  onPressed: () => Get.to(() => SignupScreen()),
                  child: Text(
                    UTexts.signUp,
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
