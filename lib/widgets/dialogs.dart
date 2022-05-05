import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../extensions.dart';
import '../widgets/button_general.dart';

import '../controllers/home_controller.dart';

class Dialogs {
  static HomeController _controller = Get.find(tag: "HOME");

  static newGameDialog(context) async {
    _controller.textEditingController.text = _controller.generateGameName();
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
                  onSubmitted: (value) async {
                    await _controller.newGame(value);
                  },
                  controller: _controller.textEditingController,
                ),
                ButtonGeneral(
                  onTap: () async {
                    await _controller
                        .newGame(_controller.textEditingController.text);
                  },
                  widget:
                      Text("Create New Game", style: TextStyle(fontSize: 20)),
                  color: Colors.blue,
                )
              ],
            ),
          ),
        );
      },
    );
  }

  static loadGameDialog(context) async {
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
                Expanded(
                    child: ListView.builder(
                  itemCount: _controller.games.length,
                  padding: EdgeInsets.zero,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(_controller
                          .games[_controller.games.length - index - 1].name),
                      onTap: () async{
                        await _controller.loadGame(_controller
                            .games[_controller.games.length - index - 1]);
                      },
                      leading: Image.asset("logo.png".getAssetImage),
                      trailing: IconButton(
                        icon: Icon(Icons.remove,color: Colors.red,),
                        onPressed: () async{
                          _controller.removeGame(_controller.games[_controller.games.length - index - 1]);
                        },
                      ),
                    );
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
