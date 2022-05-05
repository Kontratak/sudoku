import 'package:hive/hive.dart';
import 'package:sudoku_api/sudoku_api.dart' hide Cell;
import '../models/location.dart';
import 'package:uuid/uuid.dart';
import '../models/cell.dart';
import '../models/game.dart';

class DatabaseOperations{

  static final _box = Hive.box("sudoku");
  static final _gameBox = Hive.box<Game>("games");
  static final _cellBox = Hive.box<Cell>("cells");

  static getCells(String gameId){
    return _cellBox.values.where((element) => element.gameId == gameId).toList();
  }

  static getGames(){
    return _gameBox.values.toList();
  }

  static Future<String> addGame(String name) async{
    var uuid = Uuid().v1();
    _gameBox.add(Game(uuid,name));
    await addCells(uuid);
    return uuid;
  }

  static addCells(String gameId) async{
    PuzzleOptions puzzleOptions = PuzzleOptions(patternName: "winter");
    Puzzle puzzle = Puzzle(puzzleOptions);
    await puzzle.generate();
    int index = 0;
    for(int i = 0;i<9;i++){
      for(int j = 0;j<9;j++){
        _cellBox.add(Cell(puzzle.board()!.cellAt(Position(row: i,column: j)).getValue()!.toString(),
            Location(i,j,((i/3).floor()*3)+(j/3).floor()),gameId,Uuid().v4(),
            puzzle.board()!.cellAt(Position(row: i,column: j)).getValue()!.toString() != "0" ? false : true));
        if(j%3 == 2) index++;
      }
      if(i%3 != 2) index = 0; // TODO renew at group 4-5-6
    }
  }

  static modifyCell(int gameId){

  }

}