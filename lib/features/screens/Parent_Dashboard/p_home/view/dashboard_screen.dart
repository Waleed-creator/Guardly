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
        backgroundColor: UColors.dashboard,
        body: SafeArea(
          child: Consumer<DashboardController>(
            builder: (context, controller, child) {
              if (controller.user == null) {
                return const Center(child: CircularProgressIndicator());
              }

              return Column(
                children: [
                  const SizedBox(height: 13),

                  // Fixed Part: Header and Device Card
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

                  Expanded(
                    child: Stack(
                      children: [
                        SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          padding: const EdgeInsets.only(top: 5, bottom: 20),
                          child: Column(
                            children: [
                              const UsageSection(),
                              const ChartSection(),
                              QuickActions(),
                              const AlertsList(),
                            ],
                          ),
                        ),

                        // 👉 Top Gradient Shadow (Isse glitchy look khatam ho jayega)
                        Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            height: 25,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  UColors.dashboard, // Background color
                                  UColors.dashboard.withValues(
                                    alpha: 0.0,
                                  ), // Fading to transparent
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
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
