import 'package:get_it/get_it.dart';
import 'package:todyapp/utils/index.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => AppStorage());
}
