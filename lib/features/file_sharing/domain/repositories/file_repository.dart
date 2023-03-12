import 'package:leske_share/core/type_defs.dart';

import 'package:device_apps/device_apps.dart';

abstract class FileRepository {
  FutureEitherList<Application> getInstalledApps();
  FutureEitherList<String> getPhotos();
  FutureEitherList<String> getVideos();
  FutureEitherList<String> getAudios();
}