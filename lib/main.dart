import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sudoku_flutter/controllers/play_controller.dart';
import 'package:sudoku_flutter/models/cell.dart';
import 'package:sudoku_flutter/models/game.dart';
import 'models/location.dart';
import 'routes.dart';
import 'routes/home.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initHive();
  Get.put(PlayController(),tag: "PLAY");
  runApp(GetMaterialApp(
    getPages: Routes.pages,
    home: Home(),
  ));
}

 initHive() async{
  Directory dir = await getApplicationSupportDirectory();
  //Hive.deleteBoxFromDisk('cells',path : dir.path);
  Hive.init(dir.path);
  Hive.registerAdapter(LocationAdapter());
  Hive.registerAdapter(GameAdapter());
  Hive.registerAdapter(CellAdapter());
  await Hive.openBox('sudoku');
  await Hive.openBox<Game>('games');
  await Hive.openBox<Cell>('cells');
}