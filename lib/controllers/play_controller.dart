import 'package:get/get.dart';
import 'package:sudoku_flutter/models/cell.dart';
import 'package:sudoku_flutter/models/location.dart';
import 'package:sudoku_flutter/services/database_operations.dart';

class PlayController extends GetxController{

  RxList<Cell> cells = <Cell>[].obs;
  RxList numbers = [1,2,3,4,5,6,7,8,9].obs;
  RxList<Location> redLocations = <Location>[].obs;

  Rx<Location> selectedLocation = Location(0, 0,0).obs;
  RxInt selectedIndex = (-1).obs;

  loadCells(String gameId){
    cells.value = DatabaseOperations.getCells(gameId);
  }

  setSelectedLocation(int index){
    selectedLocation.value = cells[index].location;
    selectedIndex.value = index;
  }

  isCollided(Location location){
    return redLocations.firstWhereOrNull((element) => element == location) != null ? true : false;
  }

  setNumberOnLocation(int number){
    redLocations.clear();
    var a = cells.where((p0) => (p0.location.row == selectedLocation.value.row
        || p0.location.column == selectedLocation.value.column
        || p0.location.group == selectedLocation.value.group)
        && p0.number == number.toString()).toList();
    if(a.isEmpty){
      cells[selectedIndex.value].number = number.toString();
      cells.refresh();
    }
    else {
      for(var elem in a) {
        redLocations.add(elem.location);
      }
    }
  }


}