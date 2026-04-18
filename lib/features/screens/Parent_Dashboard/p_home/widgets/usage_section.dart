import 'package:flutter/material.dart';
import 'package:guardly/Utilities/constants/colors.dart';

class UsageSection extends StatelessWidget {
  const UsageSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: const Color.fromARGB(
          150,
          255,
          255,
          255,
        ), // Light background color
        // borderRadius: BorderRadius.circular(24), // Rounded corners
      ),
      child: Row(
        children: [
          // Middle Side: Device Name
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Total Screen Time",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),

                const Text(
                  "Today, December 18",
                  style: TextStyle(
                    color: UColors.dButtonSecondary,
                    fontSize: 13,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),

          // Right Side: Time Chip
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "8h 42m",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: UColors.bprimary,
                  ),
                ),
                const SizedBox(height: 4),
                ////  Last Weeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeekkkkk
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 5,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(
                      0xFFFFF4D2,
                    ), // Light yellowish/orange background
                    borderRadius: BorderRadius.circular(
                      10,
                    ), // Pill shape rounded corners
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize
                        .min, // Container ko content ke mutabiq chota rakhta hai
                    children: [
                      const Text(
                        "+15%",
                        style: TextStyle(
                          color: Color(0xFFD97706), // Dark orange color
                          fontWeight: FontWeight.bold,
                          fontSize: 11,
                        ),
                      ),
                      const SizedBox(width: 3),
                      const Icon(
                        Icons.trending_up, // Chart/Arrow icon
                        color: Color(0xFFD97706),
                        size: 18,
                      ),
                      const SizedBox(width: 3),
                      const Text(
                        "than last week",
                        style: TextStyle(
                          color: Color(0xFFD97706),
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
