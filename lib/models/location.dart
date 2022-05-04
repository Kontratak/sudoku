import 'package:hive/hive.dart';
part 'location.g.dart';

@HiveType(typeId: 3)
class Location{
  @HiveField(0)
  int row;
  @HiveField(1)
  int column;
  @HiveField(2)
  int group;
  Location(this.row,this.column,this.group);
}