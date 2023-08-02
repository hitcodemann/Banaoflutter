import 'package:flutter/material.dart';
import 'package:routine/ui/components/custom_bottom_navigation.dart';
import 'package:routine/ui/pages/chat.dart';
import 'package:routine/ui/pages/home.dart';
import 'package:routine/ui/pages/hub.dart';
import 'package:routine/ui/pages/learn.dart';
import 'package:routine/ui/pages/profile.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<CustomBottomNavigationItem> navigationBarItems = [
    CustomBottomNavigationItem(
        iconPath: "assets/icons/ic_home.svg", label: "Home"),
    CustomBottomNavigationItem(
        iconPath: "assets/icons/ic_learn_outlined.svg", label: "Learn"),
    CustomBottomNavigationItem(
        iconPath: "assets/icons/ic_hub.svg", label: "Hub"),
    CustomBottomNavigationItem(
        iconPath: "assets/icons/ic_chat.svg", label: "Chat"),
    CustomBottomNavigationItem(iconPath: "", label: "Profile"),
  ];
  int selectedIndex = 0;
  final _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigation(
          items: navigationBarItems,
          selectedIndex: selectedIndex,
          onSelected: (index) {
            setState(() {
              selectedIndex = index;
              _pageController.jumpToPage(index);
            });
          }),
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          Home(),
          Learn(),
          Hub(),
          Chat(),
          Profile(),
        ], //
      ),
    );
  }
}
