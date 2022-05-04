import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sudoku_flutter/widgets/button_general.dart';
import 'package:uuid/uuid.dart';

import '../controllers/home_controller.dart';

class Dialogs{

  static HomeController _controller = Get.find(tag : "HOME");

  static newGameDialog(context) async{
    var uuid = Uuid().v4();
    _controller.textEditingController.text = "New_Game_$uuid";
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text('Create A New Game'),
          content: Container(
            height: 150.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                TextField(
                  onSubmitted: (value) async{
                    await _controller.newGame(value);
                  },
                  controller: _controller.textEditingController,
                ),
                ButtonGeneral(onTap: () async {
                  await _controller.newGame(_controller.textEditingController.text);
                },text: "Create New Game",color: Colors.blue,)
              ],
            ),
          ),
        );
      },
    );
  }

  static loadGameDialog(context) async{
    await _controller.loadGames();
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text('Recent Games'),
          content: Container(
            width: Get.width,
            height: Get.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Expanded(child: ListView.builder(
                  itemCount: _controller.games.length,
                  itemBuilder: (BuildContext context,int index){
                    return ListTile(title: Text(_controller.games[_controller.games.length - index -1].name));
                  },
                ))
              ],
            ),
          ),
        );
      },
    );
  }

}
