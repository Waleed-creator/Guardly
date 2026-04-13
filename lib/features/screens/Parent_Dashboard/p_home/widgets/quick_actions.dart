import 'package:flutter/material.dart';
import '../model/action_model.dart';

class QuickActions extends StatelessWidget {
  QuickActions({super.key});

  final List<ActionModel> actions = [
    ActionModel(title: "Live Tracking", icon: Icons.location_on),
    ActionModel(title: "App Management", icon: Icons.apps),
    ActionModel(title: "Block Late Night", icon: Icons.nightlight),
    ActionModel(title: "Screenshots", icon: Icons.image),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: actions.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) {
        final action = actions[index];

        return Card(
          margin: EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(action.icon),
              SizedBox(height: 8),
              Text(action.title),
            ],
          ),
        );
      },
    );
  }
}
