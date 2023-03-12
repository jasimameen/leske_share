import 'package:device_apps/device_apps.dart';
import 'package:leske_share/core/type_defs.dart';
import 'package:leske_share/features/file_sharing/domain/repositories/file_repository.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';

class GetDeviceApps implements UseCase<List<Application>, NoParams> {
  final FileRepository repository;

  GetDeviceApps(this.repository);

  @override
  FutureEitherList<Application> call(NoParams params) async {
    return await repository.getInstalledApps();
  }
}
