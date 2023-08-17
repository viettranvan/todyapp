import 'package:flutter_secure_storage/flutter_secure_storage.dart';

enum AppStorageKey {
  idToken('accessToken'),
  refreshToken('refreshToken');

  const AppStorageKey(this.name);
  final String name;
}

class AppStorage {
  static const storage = FlutterSecureStorage(
      iOptions: IOSOptions(accountName: 'resource_management_flutter'),
      aOptions: AndroidOptions(encryptedSharedPreferences: true));

  Future<String?> getValue(AppStorageKey key) => storage.read(key: key.name);

  Future<void> setValue(AppStorageKey key, String? value) =>
      storage.write(key: key.name, value: value);

  Future<void> deleteValue(AppStorageKey key) => storage.delete(key: key.name);

  Future<void> deleteAll() => storage.deleteAll();
}
