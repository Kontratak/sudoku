import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sudoku_flutter/controllers/play_controller.dart';

import '../widgets/cell.dart';

class Play extends StatelessWidget {
  Play({Key? key}) : super(key: key);

  PlayController _controller = Get.find(tag: "PLAY");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 20,left: 4,right: 4),
          child: Column(
            children: [
              SizedBox(
                width: Get.width,
                height: Get.height * 0.6,
                child: GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 45,
                        childAspectRatio: 0.9,
                        crossAxisSpacing: 0,
                        mainAxisSpacing: 0),
                    itemCount: _controller.cells.length,
                    itemBuilder: (BuildContext ctx, i) {
                      return Obx(() => InkWell(
                          onTap: (){
                            if(_controller.cells[i].isModifiable)
                              _controller.setSelectedLocation(i);
                          },
                          child: Cell(number: _controller.cells[i].number,index : i,
                            isSelected: _controller.selectedIndex.value != -1 && i == _controller.selectedIndex.value,
                            isModifiable: _controller.cells[i].isModifiable,isCollided : _controller.isCollided(_controller.cells[i].location))));
                    }
                ),
              ),
              SizedBox(
                width: Get.width,
                height: Get.width * 0.1,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,

                  itemCount: _controller.numbers.length,
                  itemBuilder: (BuildContext context,int index){
                    return InkWell(
                        onTap: (){
                          _controller.setNumberOnLocation(_controller.numbers[index]);
                        },
                        child: Cell(number: _controller.numbers[index].toString(),index : index,isModifiable: false));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }



}
