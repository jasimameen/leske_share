import 'package:device_apps/device_apps.dart';
import 'package:leske_share/core/error/failures.dart';
import 'package:leske_share/features/file_sharing/domain/repositories/file_repository.dart';
import 'package:fpdart/fpdart.dart';
import '../../../../core/type_defs.dart';

class FileRepositoryImpl implements FileRepository {
  @override
  FutureEitherList<Application> getInstalledApps() async {
    try {
      final installedApps = await DeviceApps.getInstalledApplications(
        includeAppIcons: true,
      );

      return right(installedApps);
    } catch (err) {
      return left(const AppFetchFailure(message: 'failed to fetch apps'));
    }
  }

  @override
  FutureEitherList<String> getPhotos() async {
    throw '';
  }

  @override
  FutureEitherList<String> getVideos() async {
    throw '';
  }

  @override
  FutureEitherList<String> getAudios() async {
    throw '';
  }
}
