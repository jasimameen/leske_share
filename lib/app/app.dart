import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:leske_share/features/file_sharing/presentation/pages/send/send_screen.dart';

import '../core/theme.dart';

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

      // themes
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.light,

      // entry
      home: const SendScreen(),

      // debugs
      debugShowCheckedModeBanner: false,
    );
  }
}
