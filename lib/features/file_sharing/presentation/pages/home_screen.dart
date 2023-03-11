// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:leske_share/core/utils.dart';
import 'package:leske_share/features/file_sharing/presentation/pages/receive/receive_screen.dart';
import 'package:leske_share/features/file_sharing/presentation/pages/send/send_screen.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'LeskeShare',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        actions: [
          const Icon(CupertinoIcons.qrcode),
          10.wSizedBox,
          const Icon(CupertinoIcons.info),
          10.wSizedBox,
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // actions
              ActionButton(
                background: Colors.green,
                iconData: CupertinoIcons.share,
                label: 'Send',
                foreground: Colors.white,
                onTap: () {
                  context.go(const SendScreen());
                },
              ),

              40.hSizedBox,

              ActionButton(
                background: Colors.blue,
                iconData: CupertinoIcons.arrow_down_doc,
                label: 'Receive',
                foreground: Colors.white,
                onTap: () {
                  context.go(const ReceiveScreen());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ActionButton extends StatelessWidget {
  const ActionButton({
    Key? key,
    required this.iconData,
    required this.label,
    required this.background,
    this.foreground,
    this.onTap,
  }) : super(key: key);

  final IconData iconData;
  final String label;
  final Color background;
  final Color? foreground;

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          PhysicalModel(
            color: background,
            elevation: 10,
            shape: BoxShape.circle,
            clipBehavior: Clip.hardEdge,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Icon(
                iconData,
                color: foreground,
                size: 100,
              ),
            ),
          ),
          10.hSizedBox,
          Text(
            label,
            style: Theme.of(context).textTheme.headlineSmall,
          )
        ],
      ),
    );
  }
}
