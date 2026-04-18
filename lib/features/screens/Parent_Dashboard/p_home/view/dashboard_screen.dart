import 'package:flutter/material.dart';
import 'package:guardly/Utilities/constants/colors.dart';
import 'package:guardly/features/screens/Parent_Dashboard/p_home/controller/dashboard_controller.dart';
import 'package:guardly/features/screens/Parent_Dashboard/p_home/widgets/alerts_list.dart';
import 'package:guardly/features/screens/Parent_Dashboard/p_home/widgets/chart_section.dart';
import 'package:guardly/features/screens/Parent_Dashboard/p_home/widgets/device_card.dart';
import 'package:guardly/features/screens/Parent_Dashboard/p_home/widgets/header_section.dart';
import 'package:guardly/features/screens/Parent_Dashboard/p_home/widgets/quick_actions.dart';
import 'package:guardly/features/screens/Parent_Dashboard/p_home/widgets/tab_section.dart';
import 'package:guardly/features/screens/Parent_Dashboard/p_home/widgets/usage_section.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DashboardController()..init(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: UColors.dashboard,
        body: SafeArea(
          child: Consumer<DashboardController>(
            builder: (context, controller, child) {
              if (controller.user == null) {
                return const Center(child: CircularProgressIndicator());
              }

              return Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 13),

                        HeaderSection(
                          user: controller.user!,
                          children: controller.children,
                          onSelect: (child) => controller.changeUser(child),
                        ),

                        const DeviceCard(),

                        TabSection(
                          selectedIndex: controller.selectedTab,
                          onTap: controller.changeTab,
                        ),

                        const UsageSection(),
                        const ChartSection(),

                        //
                        SizedBox(height: 10),
                        const Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            "Quick Actions",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                          ),
                        ),
                        //
                        SizedBox(height: 10),
                        //
                        QuickActions(),
                        const AlertsList(),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),

                  // 👉 Top Gradient Shadow (ab sahi jagah pe)
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 20,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            UColors.dashboard,
                            UColors.dashboard.withValues(alpha: 0.0),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
