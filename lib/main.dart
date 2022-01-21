import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'Tree.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) => debugPrint('initialized'));
  runApp(Tree());
}
