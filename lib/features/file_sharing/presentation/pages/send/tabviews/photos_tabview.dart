// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:leske_share/core/utils.dart';

class PhotosTabView extends ConsumerWidget {
  const PhotosTabView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: 20,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 125,
        crossAxisSpacing: 5,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) => PhotoCard(isSelected: index.isEven),
    );
  }
}

class PhotoCard extends StatelessWidget {
  PhotoCard({Key? key, required this.isSelected}) : super(key: key);

  bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        // image
        Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(12),
          ),
          clipBehavior: Clip.hardEdge,
          child: Image.network('https://picsum.photos/seed/470/600'),
        ),

        // tick
        StatefulBuilder(
          builder: (BuildContext context, setState) {
            return InkWell(
              onTap: () => setState(() => isSelected = !isSelected),
              child: AnimatedSwitcher(
                duration: 200.toMilliSeconds,
                child: isSelected
                    ? const CircleAvatar(
                        backgroundColor: Colors.green,
                        child: Icon(
                          Icons.done_outline_rounded,
                          size: 30,
                          color: Colors.white,
                        ),
                      )
                    : null,
              ),
            );
          },
        ),
      ],
    );
  }
}
