import 'package:flutter/material.dart';
import 'package:guardly/Utilities/constants/colors.dart';
import 'package:guardly/features/screens/Parent_Dashboard/p_home/controller/dashboard_controller.dart';
import 'package:guardly/features/screens/Parent_Dashboard/p_home/widgets/alerts_list.dart';
import 'package:guardly/features/screens/Parent_Dashboard/p_home/widgets/chart_section.dart';
import 'package:guardly/features/screens/Parent_Dashboard/p_home/widgets/device_card.dart';
import 'package:guardly/features/screens/Parent_Dashboard/p_home/widgets/header_section.dart';
import 'package:guardly/features/screens/Parent_Dashboard/p_home/widgets/quick_actions.dart';
import 'package:guardly/features/screens/Parent_Dashboard/p_home/widgets/tab_section.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DashboardController()..init(),
      child: Scaffold(
        backgroundColor: UColors.dashboard,

        body: SafeArea(
          child: Stack(
            children: [
              Column(
                children: [
                  SizedBox(height: 13),

                  Consumer<DashboardController>(
                    builder: (context, controller, child) {
                      if (controller.user == null) {
                        return CircularProgressIndicator();
                      }

                      return HeaderSection(
                        user: controller.user!,
                        children: controller.children,
                        onSelect: (child) {
                          controller.changeUser(child);
                        },
                      );
                    },
                  ),

                  DeviceCard(),

                  Consumer<DashboardController>(
                    builder: (context, controller, child) {
                      return TabSection(
                        selectedIndex: controller.selectedTab,
                        onTap: controller.changeTab,
                      );
                    },
                  ),

                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          ChartSection(),
                          QuickActions(),
                          AlertsList(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// | Folder     | Kaam              |
// | ---------- | ----------------- |
// | view       | screen UI         |
// | widgets    | reusable UI parts |
// | controller | logic + state     |
// | model      | data structure    |

// model

// 👉 “Data ka shape define karta hai” ka matlab hai:
// tum decide karte ho ke data kis form mein hoga aur uske andar kya fields hongi

// List<ActionModel> actions = [
//   ActionModel(title: "Live Tracking", icon: Icons.location_on),
// ];

// 👉 ChangeNotifierProvider = WiFi router
// 👉 Controller = Internet data
// 👉 Consumer = Mobile jo data use kar raha hai
