import 'package:mock_test_app/utils/constants/imports.dart';

class MockTestController extends GetxController {
  //*Mock Test List
  //Popular test list
  final RxList mockTestList = RxList(popularMockTestLists);
  final RxBool mockTestArrowDownButton = RxBool(true);
  //popular. test list
  final RxList popularMockTestList = RxList(popularMockTestLists);
  //Govt. test list
  final RxList govtTestList = RxList(govtMockTestLists);
  //Private test list
  final RxList privateTestList = RxList(privateTestLists);
  //*Mock Test Discount value available
  final RxBool isMockTestDiscountAvailable = RxBool(true);
  //*MCQ Test
  final RxList mcqTestList = RxList(mcqTestLists);
  final RxBool mcqTestArrowDownButton = RxBool(true);
  final Map<String, dynamic> popularMockTestMap = {};
  popularMockTestDetailsMapData(int index){
    popularMockTestMap['title'] = popularMockTestList[index]['title'].toString();
  }

  //   final Map<String, dynamic> yearlyPackageMap = {};
  // final Map<String, dynamic> unlimitedPackageMap = {};
  // final Map<String, dynamic> specialOfferMap = {};

  // yearlyPackageDataFetch(int index) {
  //   yearlyPackageMap['name'] = yearlySubscriptionData[index].title.toString();
  //   yearlyPackageMap['entries'] = yearlySubscriptionData[index].bondLimit.toString();
  //   yearlyPackageMap['amount'] = yearlySubscriptionData[index].price.toString();
  //   yearlyPackageMap['start'] = yearlySubscriptionData[index].type.toString();
  //   yearlyPackageMap['validation'] = ksValid1Year.tr;
  // }
}
