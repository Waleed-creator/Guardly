import 'package:flutter/material.dart';
import 'package:guardly/Utilities/constants/images.dart';
import 'package:guardly/Utilities/constants/texts.dart';
import 'package:guardly/features/screens/Parent_Dashboard/p_home/model/header_section_model.dart';

class DashboardController extends ChangeNotifier {
  UserModel? user;

  List<UserModel> children = [
    UserModel(
      name: UTexts.fPerson,
      imageUrl: UImages.emma,

    ),
    UserModel(
      name: UTexts.sPerson,
      imageUrl: UImages.jack,

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