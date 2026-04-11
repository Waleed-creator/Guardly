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

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

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

// ✅ StatelessWidget se StatefulWidget mein convert kiya
class SignupPage extends StatefulWidget {
  const SignupPage({super.key, required this.image, required this.title});
  final String image;
  final String title;

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  // ✅ Popup dialog function
  void _showConfirmDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Row(
          children: [
            Icon(Icons.info_outline, color: Colors.teal),
            SizedBox(width: 8),
            Text("Confirm"),
          ],
        ),
        content: const Text("Kya aap Login page par jana chahte hain?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Nahi", style: TextStyle(color: Colors.grey)),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: UColors.bprimary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: () {
              Navigator.pop(context);
              Get.to(() => LoginScreen());
            },
            child: const Text("Haan", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  // ******************************************  Pop Up Code

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
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: UTexts.firstName,
                    hintText: "Enter your First Name",
                    filled: true,
                    fillColor: UColors.light,
                  ),
                ),
              ),
              SizedBox(width: USizes.spaceBtwInputFields),
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: UTexts.lastName,
                    hintText: "Enter your Last Name",
                    filled: true,
                    fillColor: UColors.light,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          TextFormField(
            decoration: InputDecoration(
              labelText: UTexts.email,
              hintText: "Enter your email",
              filled: true,
              fillColor: UColors.light,
            ),
          ),

          SizedBox(height: USizes.spaceBtwInputFields),

          TextFormField(
            decoration: InputDecoration(
              labelText: UTexts.cAPass,
              hintText: "Enter your Password",
              suffixIcon: const Icon(Iconsax.eye),
              filled: true,
              fillColor: UColors.light,
            ),
          ),

          SizedBox(height: USizes.spaceBtwInputFields),

          TextFormField(
            decoration: InputDecoration(
              labelText: UTexts.confirmPassword,
              hintText: UTexts.confirmYPassword,
              suffixIcon: const Icon(Iconsax.eye),
              filled: true,
              fillColor: UColors.light,
            ),
          ),

          const SizedBox(height: 10),

          // ✅ BUTTON — ab dialog dikhayega
          UElevatedButton.rectangle(
            onPressed: _showConfirmDialog, // dialog open hoga
            text: UTexts.continueButton,
            backgroundColor: UColors.bprimary,
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
