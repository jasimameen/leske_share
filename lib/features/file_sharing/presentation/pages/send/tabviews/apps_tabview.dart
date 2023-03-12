import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:leske_share/core/utils.dart';

class AppsTabView extends ConsumerWidget {
  const AppsTabView({super.key});

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
      itemBuilder: (context, index) => const AppCard(),
    );
  }
}

class AppCard extends StatelessWidget {
  const AppCard({super.key});

  @override
  Widget build(BuildContext context) {
    var subtitleStyle =
        Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.grey);
    return InkWell(
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      onTap: () => context.showSnackBar('you tapped andro'),
      child: Column(
        children: [
          const Icon(Icons.android, size: 50, color: Colors.green),
          5.hSizedBox,
          const Text('Leske Share'),
          3.hSizedBox,
          Text('10.46 MB', style: subtitleStyle),
        ],
      ),
    );
  }
}
