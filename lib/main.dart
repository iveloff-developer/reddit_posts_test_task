import 'package:flutter/material.dart';
import 'package:netsells_test/common/injection/injection.dart';

import 'app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupInjections();
  runApp(App());
}
