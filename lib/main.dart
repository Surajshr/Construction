import 'package:flutter/material.dart';
import 'package:construction_aoo/view/Pages/loginPage/LoginPage.dart';
import 'package:flutter/services.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(ConstructionApp());
}
