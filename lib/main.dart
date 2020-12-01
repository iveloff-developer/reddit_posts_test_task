import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:netsells_test/common/injection/injection.dart';

import 'app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  setupInjections();
  runApp(App());
}
