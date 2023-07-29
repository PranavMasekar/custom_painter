import 'dart:convert';
import 'dart:developer';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final colorProvider = StateProvider<String>(
  (ref) => ref.read(configProvider.notifier).getColor(),
);
final versionProvider = StateProvider<(String, bool)>(
  (ref) => ref.read(configProvider.notifier).getVersionInfo(),
);

final configProvider = NotifierProvider<RemoteConfigService, bool>(() {
  return RemoteConfigService(remoteConfig: FirebaseRemoteConfig.instance);
});

class RemoteConfigService extends Notifier<bool> {
  final FirebaseRemoteConfig remoteConfig;

  RemoteConfigService({required this.remoteConfig});

  Future<void> init() async {
    try {
      await remoteConfig.setConfigSettings(
        RemoteConfigSettings(
          fetchTimeout: const Duration(seconds: 10),
          minimumFetchInterval: Duration.zero,
        ),
      );
      await remoteConfig.setDefaults(<String, dynamic>{});
      await remoteConfig.fetchAndActivate();
    } on Exception catch (e) {
      log(e.toString());
    } finally {
      state = false;
    }
  }

  String getColor() => remoteConfig.getString("Color");

  (String, bool) getVersionInfo() {
    final jsonData = remoteConfig.getString("android_version");
    Map<String, dynamic> data = json.decode(jsonData);
    return (data["version"], data["forceUpdate"]);
  }

  @override
  bool build() => true;
}
