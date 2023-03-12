// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VideosTabView extends ConsumerWidget {
  const VideosTabView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return ConstrainedBox(
          constraints: constraints,
          child: Container(
            constraints: const BoxConstraints.expand(),
            child: ListView.builder(
              itemCount: 30,
              itemBuilder: (context, index) => const VideoCard(),
            ),
          ),
        );
      },
    );
  }
}

class VideoCard extends StatelessWidget {
  const VideoCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: ListTile(
        leading: Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(color: Colors.grey.shade300),
        ),
        title: const FittedBox(child: Text('Bunny Bunny Funny.mp4')),
        subtitle: const Text('213.54 MB'),
        trailing: SelectButton(value: true, onChanged: (value) {}),
      ),
    );
  }
}

class SelectButton extends StatelessWidget {
  const SelectButton({
    Key? key,
    this.value,
    this.onChanged,
  }) : super(key: key);

  final bool? value;
  final void Function(bool? value)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: value,
      activeColor: Colors.grey,
      checkColor: Colors.green,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      onChanged: onChanged,
    );
  }
}
