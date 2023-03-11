import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:leske_share/features/file_sharing/presentation/pages/base_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //
      title: 'Leske Share',

      // configurations
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,

      // entry
      home: const BaseScreen(),

      // thems
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.dark,

      // debugs
      debugShowCheckedModeBanner: false,
    );
  }
}
