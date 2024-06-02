import 'package:animals/data/hive/models/animal/animal_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'internal/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initHiveDatabase();
  runApp(const Application());
}

Future initHiveDatabase() async {
  await Hive.initFlutter();
  Hive.registerAdapter(AnimalModelAdapter());
  await Hive.openBox<AnimalModel>('animal_box');
}
