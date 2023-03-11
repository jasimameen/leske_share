import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:leske_share/core/theme.dart';

class SendScreen extends StatelessWidget {
  const SendScreen({super.key});

  static const tabs = [
    'History',
    'Apps',
    'Photos',
    'Videos',
    'Audios',
    'Files',
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Send Files'),
        ),
        body: Column(
          children: [
            TabBar(
              isScrollable: true,
              tabs: [
                for (final tab in tabs) Tab(text: tab),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  for (final tab in tabs) Center(child: Text(tab)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
