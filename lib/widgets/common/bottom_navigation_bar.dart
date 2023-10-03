import 'package:mock_test_app/controllers/home_controller.dart';
import 'package:mock_test_app/utils/constants/imports.dart';
import 'package:mock_test_app/views/auth/login_screen.dart';
import 'package:mock_test_app/views/homepage/home_screen.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  CustomBottomNavigationBar({super.key});
  final HomeController _homeController = Get.find<HomeController>();
  final screens = [
    HomeScreen(),
    LoginScreen(),
    HomeScreen(),
    HomeScreen(),
  ];
//Botto(
//       body: screens[_homeController.bottomNavBarIndex.value],
//       bottomNavigationBar:
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => NavigationBarTheme(
        data: NavigationBarThemeData(
          indicatorColor: cBottomNavBarColor,
          labelTextStyle: MaterialStateProperty.all(
            p14MediumTextStyle(cTextPrimaryColor),
          ),
        ),
        child: NavigationBar(
          height: height > kSmallDeviceSizeLimit ? 70 : 60,
          backgroundColor: cWhiteColor,
          selectedIndex: _homeController.bottomNavBarIndex.value,
          onDestinationSelected: (value) {
            _homeController.bottomNavBarIndex.value = value;
          },
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home),
              selectedIcon: Icon(Icons.home),
              label: ksHome,
            ),
            NavigationDestination(
              icon: Icon(Icons.text_snippet),
              selectedIcon: Icon(Icons.text_snippet),
              label: ksTest,
            ),
            NavigationDestination(
              icon: Icon(Icons.calendar_month),
              selectedIcon: Icon(Icons.calendar_month),
              label: ksSchedule,
            ),
            NavigationDestination(
              icon: Icon(Icons.feedback_outlined),
              selectedIcon: Icon(Icons.feedback_outlined),
              label: ksReward,
            ),
          ],
        ),
      ),
    );
  }
}


// class CustomBottomNavigationBar extends StatelessWidget {
//   CustomBottomNavigationBar({super.key});
//   final HomeController _homeController = Get.find<HomeController>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Obx(
//         () => _getPage(_homeController.bottomNavBarIndex.value),
//       ),
//       bottomNavigationBar: Obx(
//         () => BottomNavigationBar(
//           selectedItemColor: cBottomNavBarColor,
//           currentIndex: _homeController.bottomNavBarIndex.value,
//           onTap: (index) {
//             _homeController.bottomNavBarIndex.value = index;
//           },
//           items: const [
//             BottomNavigationBarItem(
//               icon: Icon(Icons.home),
//               label: ksHome,
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.text_snippet),
//               label: ksTest,
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.calendar_month),
//               label: ksSchedule,
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.feedback_outlined),
//               label: ksReward,
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _getPage(int index) {
//     switch (index) {
//       case 0:
//         return HomeScreen();
//       case 1:
//         return HomeScreen();
//       case 2:
//         return HomeScreen();
//       case 3:
//         return HomeScreen();
//       default:
//         return HomeScreen();
//     }
//   }
// }
