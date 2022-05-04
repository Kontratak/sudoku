import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sudoku_flutter/controllers/play_controller.dart';
import 'package:sudoku_flutter/services/database_operations.dart';

import '../models/game.dart';

class HomeController extends GetxController{

  TextEditingController textEditingController = TextEditingController();
  RxList<Game> games = <Game>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    loadGames();
  }

  newGame(String gameName) async{
    PlayController _controller = Get.find(tag: "PLAY");
    _controller.loadCells(await DatabaseOperations.addGame(gameName));
    Get.toNamed("/play");
  }

  loadGames(){
    games.value = DatabaseOperations.getGames();
  }

  quit(){

  }

}