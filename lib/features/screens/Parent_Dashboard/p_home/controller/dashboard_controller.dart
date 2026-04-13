import 'package:flutter/material.dart';
import 'package:guardly/features/screens/Parent_Dashboard/p_home/model/header_section_model.dart';

class DashboardController extends ChangeNotifier {
  UserModel? user;

  List<UserModel> children = [
    UserModel(
      name: "Ali",
      imageUrl: "assets/a.png",
      subtitle: "Child 1",
    ),
    UserModel(
      name: "Sara",
      imageUrl: "assets/b.png",
      subtitle: "Child 2",
    ),
  ];

  int selectedTab = 0;

  void changeUser(UserModel newUser) {
    user = newUser;
    notifyListeners();
  }

  void changeTab(int index) {
    selectedTab = index;
    notifyListeners();
  }

  void init() {
  if (children.isNotEmpty) {
    user = children.first;
  }
}
}