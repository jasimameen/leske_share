// ignore_for_file: public_member_api_docs, sort_constructors_first, invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:leske_share/features/file_sharing/presentation/pages/home_screen.dart';
import 'package:leske_share/features/profile/presentation/screens/profile_screen.dart';

final _indexNotifier = ValueNotifier<int>(0);

class BaseScreen extends StatelessWidget {
  const BaseScreen({super.key});

  final List<Widget> pages = const [
    HomeScreen(),
    Center(child: Text('Files')),
    ProfileScreen(),
  ];

  final tabs = const [
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.home),
      label: "Home",
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.doc),
      label: "Files",
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.person),
      label: "Account",
    )
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: _indexNotifier.value,
      length: tabs.length,
      child: Scaffold(
        body: SafeArea(
          child: ValueListenableBuilder(
            valueListenable: _indexNotifier,
            builder: (context, index, _) => pages[index],
          ),
        ),
        //
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: _BottomNav(
          tabs: tabs,
          onTap: (index) {
            _indexNotifier.value = index;
            _indexNotifier.notifyListeners();
          },
        ),
      ),
    );
  }
}

class _BottomNav extends StatelessWidget {
  const _BottomNav({required this.tabs, this.onTap});

  final List<BottomNavigationBarItem> tabs;
  final void Function(int)? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: PhysicalModel(
        color: Colors.blueGrey,
        elevation: 10,
        borderRadius: BorderRadius.circular(60),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(60),
          child: BottomNavigationBar(
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.grey,
            type: BottomNavigationBarType.fixed,
            items: tabs,
            currentIndex: _indexNotifier.value,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            onTap: onTap,
          ),
        ),
      ),
    );
  }
}
