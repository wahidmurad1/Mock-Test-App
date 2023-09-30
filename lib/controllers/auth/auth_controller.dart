import 'package:mock_test_app/utils/constants/imports.dart';

class AuthController extends GetxController {
  final TextEditingController phoneNumberController = TextEditingController();
  final RxString phoneNumber = RxString('');
  final RxBool isPhoneNumberFilled = RxBool(false);
}
