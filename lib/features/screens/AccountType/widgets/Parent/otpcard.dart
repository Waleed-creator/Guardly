import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class OTPCard extends StatelessWidget {
  final String code;

  const OTPCard({super.key, required this.code});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: const Color.fromARGB(12, 0, 0, 0), blurRadius: 6),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // OTP Text
          Text(
            formatCode(code),
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            ),
          ),

          // Copy Button
          Container(
            decoration: BoxDecoration(
              color: Colors.teal,
              borderRadius: BorderRadius.circular(12),
            ),
            child: IconButton(
              onPressed: () async {
                String textToCopy = formatCode(code);

                await Clipboard.setData(ClipboardData(text: textToCopy));

                ScaffoldMessenger.of(
                  // ignore: use_build_context_synchronously
                  context,
                ).showSnackBar(SnackBar(content: Text("Copied: $textToCopy")));
              },
              icon: Icon(Icons.copy, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  String formatCode(String code) {
    // Example: 932255 -> 932-255
    return "${code.substring(0, 3)}-${code.substring(3)}";
  }
}
