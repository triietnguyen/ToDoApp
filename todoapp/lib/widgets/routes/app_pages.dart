import 'package:get/get.dart';
import 'package:todoapp/modules/addItem/binding.dart';
import 'package:todoapp/modules/addItem/view.dart';
import 'package:todoapp/modules/detailpage/binding.dart';
import 'package:todoapp/modules/detailpage/view.dart';
import 'package:todoapp/modules/home/binding.dart';
import 'package:todoapp/modules/home/view.dart';

part './app_routes.dart';

class AppPages {
  // ignore: non_constant_identifier_names
  static var INITIAL = Routes.HOME;

  static final pages = [
    GetPage(
      name: Routes.HOME,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.ADDITEM,
      page: () => const AddItemPage(),
      binding: AddItemBinding(),
    ),
    GetPage(
      name: Routes.DETAILITEM,
      page: () => const DetailPage(),
      binding: DetailItemBinding(),
    ),
  ];
}
