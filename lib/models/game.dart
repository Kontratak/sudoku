import 'package:hive/hive.dart';
part 'game.g.dart';

@HiveType(typeId: 1)
class Game extends HiveObject {

  @HiveField(0)
  String gameId;

  @HiveField(1)
  String name;

  Game(this.gameId,this.name);

}