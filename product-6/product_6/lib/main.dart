import 'package:flutter/material.dart';
import 'app.dart';
import 'injection_container.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  runApp(EcommerceApp());
}
