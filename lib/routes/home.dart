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
            ButtonGeneral(onTap: () async=> await Dialogs.newGameDialog(context),color: Colors.red,text: "New Game",),
            ButtonGeneral(onTap: () async=> await Dialogs.loadGameDialog(context),color: Colors.green,text: "Load Game",),
            ButtonGeneral(onTap: () async=> _controller.quit(),color: Colors.red,text: "Quit",),
          ],
        ),
      ),
    );
  }



}
