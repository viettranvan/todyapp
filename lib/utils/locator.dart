import 'package:get_it/get_it.dart';

import 'app_storage.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => AppStorage());
}
