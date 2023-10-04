import 'package:mock_test_app/utils/constants/imports.dart';

class MockTestController extends GetxController{
  final RxBool isMockSearching = RxBool(false);
  final TextEditingController mockSearchController = TextEditingController();
}