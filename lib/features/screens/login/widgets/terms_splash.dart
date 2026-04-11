import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:guardly/Utilities/constants/colors.dart';


class TermsText extends StatelessWidget {
  const TermsText({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter, // abhi bhi bottomCenter
      child: Container(
        margin: const EdgeInsets.only(
          bottom: 70,
        ), // yahan 50 pixels upar uthayenge
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: 'By proceeding, you agree to our ',
            style: const TextStyle(color: UColors.textPrimary500, fontSize: 14),
            children: [
              TextSpan(
                text: 'Privacy Policy',
                style: const TextStyle(
                  color: UColors.lprimary,
                  decoration: TextDecoration.underline,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () async {
                    final url = Uri.parse('https://yourapp.com/privacy');
                    if (await canLaunchUrl(url)) {
                      await launchUrl(url);
                    }
                  },
              ),
              const TextSpan(
                text: ' and ',
                style: TextStyle(color: UColors.textPrimary500),
              ),
              TextSpan(
                text: 'Conditions of Use',
                style: const TextStyle(
                  color: UColors.lprimary,
                  decoration: TextDecoration.underline,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () async {
                    final url = Uri.parse('https://yourapp.com/terms');
                    if (await canLaunchUrl(url)) {
                      await launchUrl(url);
                    }
                  },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

