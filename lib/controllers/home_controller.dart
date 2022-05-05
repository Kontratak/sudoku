import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:short_uuids/short_uuids.dart';
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
    await _controller.loadCells(await DatabaseOperations.addGame(gameName));
    Get.toNamed("/play");
  }

  generateGameName(){
    return "New_Game_${ShortUuid().generate()}";
  }

  loadGames(){
    games.value = DatabaseOperations.getGames();
  }

  removeGame(Game game) async{
    await games.where((p0) => p0 == game).first.delete();
  }

  loadGame(Game game) async{
    PlayController _controller = Get.find(tag: "PLAY");
    await _controller.loadCells(game.gameId);
    Get.toNamed("/play");
  }

  quit(){

  }

}