import 'package:mock_test_app/utils/constants/imports.dart';

class MockTestController extends GetxController {
  final RxBool isMockSearching = RxBool(false);
  final TextEditingController mockSearchController = TextEditingController();
  //*Mock Test List
  final RxList mockTestList = RxList(popularMockTestLists);
  final RxBool mockTestArrowDownButton = RxBool(true);
  //*Mock Test Discount value available
  final RxBool isMockTestDiscountAvailable = RxBool(true);
    //*MCQ Test
  final RxList mcqTestList = RxList(mcqTestLists);
  final RxBool mcqTestArrowDownButton = RxBool(true);
}
