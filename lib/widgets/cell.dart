import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/play_controller.dart';

class Cell extends StatelessWidget {
  Cell({Key? key, this.number,required this.index, this.isSelected = false, this.isModifiable = true,this.isCollided = false}) : super(key: key);

  final String? number;
  final int index;
  final bool isSelected;
  final bool isModifiable;
  final bool isCollided;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border : Border(bottom: BorderSide(color: isModifiable && isSelected ? Colors.blue : Colors.black,width: index % 27 >= 18 || isModifiable && isSelected  ? 3 : 1),left: BorderSide(color: isModifiable && isSelected ? Colors.blue : Colors.black,width: index % 3 == 0 || isModifiable && isSelected ? 3 : 1), top: BorderSide(color: isModifiable && isSelected ? Colors.blue : Colors.black,width: isModifiable && isSelected ? 3 : 0),right: BorderSide(color: isModifiable && isSelected ? Colors.blue : Colors.black,width: isModifiable && isSelected ? 3 : 0)),
        color: isCollided ? Colors.red : Colors.white,
      ),
      width: Get.width * 0.1,
      height: Get.width * 0.1,
      child: Center(child: Text(number != null && number != "0" ? number! : ""),),
    );
  }
}
