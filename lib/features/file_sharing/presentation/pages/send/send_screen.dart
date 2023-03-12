// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

import 'tabviews/tabviews.dart';

class SendScreen extends StatelessWidget {
  const SendScreen({super.key});

  static const tabs = [
    TabItem(label: 'History', child: HistoryTabView()),
    TabItem(label: 'Apps', child: AppsTabView()),
    TabItem(label: 'Photos', child: PhotosTabView()),
    TabItem(label: 'Videos', child: VideosTabView()),
    TabItem(label: 'Audios', child: AudiosTabView()),
    TabItem(label: 'Files', child: FilesTabView()),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 3,
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
                for (final tab in tabs) Tab(text: tab.label),
              ],
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: TabBarView(
                  children: tabs.map((tab) => tab.child).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TabItem {
  final String label;
  final Widget child;

  const TabItem({
    required this.label,
    required this.child,
  });
}
