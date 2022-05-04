import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'routes/home.dart';
import 'routes/play.dart';

class Routes{

  static String home = "/home";
  static String play = "/play";


  static List<GetPage<dynamic>> pages = [
    GetPage(name: home,page: ()=> Home()),
    GetPage(name: play,page: ()=> Play()),
  ];
}

