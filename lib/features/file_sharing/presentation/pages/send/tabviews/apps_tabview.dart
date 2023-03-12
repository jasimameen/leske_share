// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:leske_share/core/utils.dart';
import 'package:leske_share/features/file_sharing/data/repositories/file_repository_impl.dart';

class AppsTabView extends ConsumerWidget {
  const AppsTabView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(appProvider.notifier).loadApps();
    final apps = ref.watch(appProvider);
    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: apps.length,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 125,
        crossAxisSpacing: 5,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) => AppCard(
        appInfo: apps[index],
      ),
    );
  }
}

class AppCard extends StatelessWidget {
  const AppCard({
    Key? key,
    required this.appInfo,
  }) : super(key: key);

  final Application appInfo;

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
          // const Icon(Icons.android, size: 50, color: Colors.green),
          Image.memory(
            (appInfo as ApplicationWithIcon).icon,
            height: 50,
            width: 50,
            fit: BoxFit.contain,
            gaplessPlayback: true,
          ),
          5.hSizedBox,
          Flexible(
            child: Text(
              appInfo.appName,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          3.hSizedBox,
          Text('10.46 MB', style: subtitleStyle),
        ],
      ),
    );
  }
}

final appProvider =
    StateNotifierProvider<AppNotifier, List<Application>>((ref) {
  return AppNotifier();
});

class AppNotifier extends StateNotifier<List<Application>> {
  AppNotifier() : super([]);

  Future<void> loadApps() async {
    final either = await FileRepositoryImpl().getInstalledApps();

    state = either.fold(
      (l) => [],
      (r) => r,
    );
  }
}
