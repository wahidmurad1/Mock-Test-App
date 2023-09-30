import 'package:mock_test_app/utils/constants/imports.dart';
import 'package:mock_test_app/controllers/common_controller/globa_controller.dart';
import 'package:mock_test_app/controllers/splash_screen_controller.dart';

class BinderController implements Bindings {
  @override
  void dependencies() {
    Get.put<GlobalController>(GlobalController(), permanent: true);
    Get.put<SplashScreenController>(SplashScreenController());
  }
}
