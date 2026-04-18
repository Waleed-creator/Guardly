import 'package:flutter/material.dart';

class AlertsList extends StatelessWidget {
  const AlertsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
      child: Column(
        children: [
          // --- Header Row ---
          Row(
            children: [
              const Text(
                "Recent Alerts",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: Color(0xFF0D1B2A),
                ),
              ),
              const SizedBox(width: 8),
              // Red Counter Badge
              Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  color: Color(0xFFE63946),
                  shape: BoxShape.circle,
                ),
                child: const Text(
                  "2",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Spacer(),
              // View All Button
              TextButton(
                onPressed: () {},
                child: Row(
                  children: const [
                    Text(
                      "View All",
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Icon(
                      Icons.chevron_right,
                      size: 19,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ],
                ),
              ),
            ],
          ),
          // const SizedBox(height: 20),

          // --- Alert Items ---
          _buildAlertCard(
            title: "Suspicious Screenshot",
            time: "3:42 PM",
            description: "AI detected inappropriate content in messaging app",
            icon: Icons.warning_amber_rounded,
            iconBgColor: const Color(0xFFFFE5E5),
            iconColor: Colors.red,
          ),
          const SizedBox(height: 12),
          _buildAlertCard(
            title: "App Block Attempt",
            time: "2:15 PM",
            description: "Child attempted to access blocked social media app",
            icon: Icons.shield_outlined,
            iconBgColor: const Color(0xFFE5F1FF),
            iconColor: Colors.blue,
          ),
        ],
      ),
    );
  }

  Widget _buildAlertCard({
    required String title,
    required String time,
    required String description,
    required IconData icon,
    required Color iconBgColor,
    required Color iconColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color.fromARGB(93, 255, 255, 255),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade100),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Styled Icon Background
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: iconBgColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: iconColor),
              ),
              const SizedBox(width: 12),
              // Title and Time
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      time,
                      style: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(Icons.chevron_right, color: Colors.grey.shade300, size: 28,),
            ],
          ),
          const SizedBox(height: 12),
          // Description Text
          Text(
            description,
            style: TextStyle(
              color: Colors.grey.shade600,
              fontSize: 14,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}
