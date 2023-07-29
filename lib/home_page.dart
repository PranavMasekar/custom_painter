import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'remote_config_service.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    ref.read(configProvider.notifier).init();
    super.initState();
  }

  Future<void> checkForUpdate() async {
    final (version, forceUpdate) = ref.watch(versionProvider);
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    log(packageInfo.version);
    log(version);
    log(forceUpdate.toString());
    if (packageInfo.version.compareTo(version) == -1 && forceUpdate) {
      log("Force update is required");
      //! Show Update App Dialog
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(
      configProvider,
      (previous, next) {
        // !next means init method is complete
        if (!next) {
          checkForUpdate();
        }
      },
    );

    return Scaffold(
      appBar: AppBar(title: const Text("Firebase Remote Config")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ref.watch(configProvider)
              ? const Center(child: CircularProgressIndicator())
              : Center(
                  child: Container(
                    height: 100,
                    width: 100,
                    color: Color(int.parse('0xFF${ref.watch(colorProvider)}')),
                  ),
                ),
        ],
      ),
    );
  }
}
