import 'package:leske_share/core/type_defs.dart';

abstract class FileRepository {
  FutureEither<String> getApps();
  FutureEither<String> getPhotos();
  FutureEither<String> getVideos();
  FutureEither<String> getAudios();
  FutureEither<String> getPDFs();
}
