import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AudiosTabView extends ConsumerWidget {
  const AudiosTabView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      child: const Text('Audios Tab View'),
    );
  }
}