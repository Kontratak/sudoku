import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sudoku_flutter/controllers/home_controller.dart';

import '../widgets/button_general.dart';
import '../widgets/dialogs.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  HomeController _controller = Get.put(HomeController(),tag: "HOME");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonGeneral(onTap: () async=> await Dialogs.newGameDialog(context),color: Colors.red,widget: Text("New Game",style: TextStyle(fontSize: 20)),),
            ButtonGeneral(onTap: () async=> await Dialogs.loadGameDialog(context),color: Colors.green,widget: Text("Load Game",style: TextStyle(fontSize: 20)),),
            ButtonGeneral(onTap: () async=> _controller.quit(),color: Colors.red,widget: Text("Quit",style: TextStyle(fontSize: 20)),),
          ],
        ),
      ),
    );
  }



}
