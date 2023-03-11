import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:leske_share/features/file_sharing/presentation/pages/home_screen.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({super.key});

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  final List<Widget> pages = const [
    HomeScreen(),
    Center(child: Text('Files')),
    Center(child: Text('Chat')),
    Center(child: Text('Settings')),
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
      icon: Icon(CupertinoIcons.text_bubble),
      label: "Chat",
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.gear),
      label: "Settings",
    )
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 3,
      length: tabs.length,
      child: Scaffold(
        body: SafeArea(child: pages[_currentIndex]),

        //
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Padding(
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
                currentIndex: _currentIndex,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                onTap: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
