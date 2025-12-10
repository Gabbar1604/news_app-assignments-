import 'package:get/get.dart';
import 'package:news_app/Pages/ArticalPage/ArticalPage.dart';
import 'package:news_app/Pages/Dashboard/DashboardPage.dart';
import 'package:news_app/Pages/HomePage/HomePage.dart';
// import 'package:news_app/Pages/Profile/ProfilePage.dart';

class BottomNavController extends GetxController {
  RxInt index = 0.obs;

  var pages = [
    const HomePage(),
    const DashboardPage(),
    const ArticalPage(),
    // const ProfilePage(),
  ];
}
