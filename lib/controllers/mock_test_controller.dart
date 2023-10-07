import 'package:mock_test_app/utils/constants/imports.dart';

class MockTestController extends GetxController {
  //*Mock Test List
  //Popular test list
  final RxList mockTestList = RxList(popularMockTestLists);
  final RxBool mockTestArrowDownButton = RxBool(true);
  //Govt. test list
  final RxList govtTestList = RxList(govtMockTestLists);
  //Private test list
  final RxList privateTestList = RxList(privateTestLists);
  //*Mock Test Discount value available
  final RxBool isMockTestDiscountAvailable = RxBool(true);
  //*MCQ Test
  final RxList mcqTestList = RxList(mcqTestLists);
  final RxBool mcqTestArrowDownButton = RxBool(true);
}
