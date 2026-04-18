import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:guardly/Utilities/constants/images.dart';

class QuickActions extends StatelessWidget {
  const QuickActions({super.key});

  @override
  Widget build(BuildContext context) {
    // List of data for each card
    final List<Map<String, dynamic>> actions = [
      {
        "title": "Live Location Tracking",
        "subtitle": "Real-time GPS monitoring",
        "badge": "Live",
        "icon": UImages.location,
        "actionText": "View Map",
        "color": Colors.tealAccent.shade700,
      },
      {
        "title": "App Management",
        "subtitle": "Monitor app usage time, block or unblock apps",
        "badge": "24 Apps",
        "icon": UImages.appManagement,
        "actionText": "Manage",
        "color": Colors.tealAccent.shade700,
      },
      {
        "title": "Block Late Night Usage",
        "subtitle": "Set bedtime restrictions and",
        "badge": "Active",
        "icon": UImages.blockLateNight,
        "actionText": "Configure",
        "color": Colors.tealAccent.shade700,
      },
      // {
      //   "title": "Suspicious Screen Captures",
      //   "subtitle": "View suspicious activity screenshots",
      //   "badge": "128",
      //   "icon": UImages.sSCapture,
      //   "actionText": "Browse",
      //   "color": Colors.tealAccent.shade700,
      // },
    ];

    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical:4),
      itemCount: actions.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.9, // Adjust this for height
      ),
      itemBuilder: (context, index) {
        final item = actions[index];
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
            color: const Color.fromARGB(68, 255, 255, 255),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Row: Icon and Badge
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Icon Settings **************************************************************
                  SvgPicture.asset(item['icon'], height: 32, width: 32),
                  // Badge Settings **************************************************************
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Colors.teal.withValues(alpha: 0.2),
                      ),
                    ),
                    child: Text(
                      item['badge'],
                      style: TextStyle(
                        color: Colors.teal.shade700,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              // Title Settings **************************************************************
              SizedBox(height: 8,),
              Text(
                item['title'],
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 6),
              // SubTitle Settings **************************************************************
              // Subtitle
              Text(
                item['subtitle'],
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
              ),
              // Bottom Action Row Settings **************************************************************
              const SizedBox(height: 6),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    item['actionText'],
                    style: TextStyle(
                      color: Colors.teal.shade700,
                      fontWeight: FontWeight.w600,
                      fontSize: 13
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward,
                    size: 17,
                    color: Colors.teal.shade700,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
