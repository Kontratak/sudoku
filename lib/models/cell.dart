import 'package:hive/hive.dart';
import 'location.dart';
part 'cell.g.dart';

@HiveType(typeId: 0)
class Cell extends HiveObject {

  @HiveField(0)
  String? number;

  @HiveField(1)
  Location location;

  @HiveField(2)
  String gameId;

  @HiveField(3)
  String cellId;

  @HiveField(4)
  bool isModifiable;

  Cell(this.number,this.location,this.gameId,this.cellId,this.isModifiable);

}