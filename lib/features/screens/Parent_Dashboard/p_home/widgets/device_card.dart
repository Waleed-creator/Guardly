import 'package:flutter/material.dart';

class DeviceCard extends StatelessWidget {
  const DeviceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      decoration: BoxDecoration(
        color: const Color.fromARGB(124, 255, 255, 255), // Light background color
        borderRadius: BorderRadius.circular(24), // Rounded corners
      ),
      child: Row(
        children: [
          // Left Side: Phone Icon
          const Icon(Icons.phone_iphone, size: 39, color: Color(0xFF1A202E)),
          const SizedBox(width: 16),

          // Middle Side: Device Name
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Device Name",
                  style: TextStyle(color: Color(0xFF707E94), fontSize: 12),
                ),
                const SizedBox(height: 4),
                const Text(
                  "iPhone 13",
                  style: TextStyle(
                    color: Color(0xFF1A202E),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          // Right Side: Time Chip
          Row(
            children: [
              const Icon(Icons.access_time, size: 18, color: Color(0xFF0D9488)),
              const SizedBox(width: 6),
              const Text(
                "2 mins ago",
                style: TextStyle(
                  color: Color(0xFF0D9488),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
