import 'package:mock_test_app/utils/constants/imports.dart';

class GlobalController extends GetxController {
  //* parent route
  final RxString parentRoute = RxString("");

  //*Bottom Navigation bar index
  RxInt bottomNavBarIndex = RxInt(0);
  final screens = [
    krHomeScreen,
    krTestScreen,
    krProfile,
    krHomeScreen,
  ];

  //*Test Screen Search
  final RxBool isTestSearching = RxBool(false);
  final TextEditingController testSearchController = TextEditingController();
}
