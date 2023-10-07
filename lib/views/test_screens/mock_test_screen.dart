import 'package:mock_test_app/controllers/common_controller/global_controller.dart';
import 'package:mock_test_app/controllers/home_controller.dart';
import 'package:mock_test_app/controllers/mock_test_controller.dart';
import 'package:mock_test_app/utils/constants/imports.dart';

class MockTestScreen extends StatelessWidget {
  MockTestScreen({super.key});
  final GlobalController _globalController = Get.find<GlobalController>();
  final MockTestController _mockTestController = Get.find<MockTestController>();
  final HomeController _homeController = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: cWhiteColor,
        //*AppBar
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kAppBarSize),
          child: CustomSearchAppBar(
            searchBackButtonOnPressed: () {
              _globalController.isTestSearching.value = false;
            },
            title: ksMockTest,
            onChanged: (value) {},
            closeIconOnPressed: () {},
            filterButtonOnPressed: () {},
          ),
        ),
        body: Column(
          children: [
            TabBar(
              // unselectedLabelStyle: p12RegularTextStyle(cTextSecondaryColor),
              indicatorColor: cBlackColor,
              unselectedLabelColor: cGreyColor,
              tabs: [
                Tab(
                  child: Text(
                    ksPopular,
                    style: p16RegularTextStyle(cTextPrimaryColor),
                  ),
                ),
                Tab(
                  child: Text(
                    ksGovt,
                    style: p16RegularTextStyle(cTextPrimaryColor),
                  ),
                ),
                Tab(
                  child: Text(
                    ksPrivate,
                    style: p16RegularTextStyle(cTextPrimaryColor),
                  ),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(physics: const NeverScrollableScrollPhysics(), children: [
                //*Popular Test List in tabbar
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: _mockTestController.mockTestList.length,
                  itemBuilder: (context, index) {
                    var item = _mockTestController.mockTestList[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: k5Padding),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(k10BorderRadius),
                        child: TextButton(
                          style: kTextButtonStyle,
                          onPressed: () async {
                            // ll(index);
                          },
                          child: CustomListItems(
                            backgroundImage: AssetImage(item['image']),
                            itemTitle: item['title'],
                            subTittle1: item['examTime'],
                            subTittle2: item['rating'],
                            priceWidget: _mockTestController.isMockTestDiscountAvailable.value
                                ? Container(
                                    width: h50,
                                    height: h16,
                                    decoration: BoxDecoration(
                                      color: cGreenColor,
                                      borderRadius: BorderRadius.circular(k5BorderRadius),
                                    ),
                                    child: Stack(
                                      children: [
                                        Center(
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(left: k8Padding),
                                                child: Text(
                                                  '৯৯০',
                                                  style: p10MediumLineThrowTextStyle(cWhiteColor),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                              const Spacer(),
                                              Padding(
                                                padding: const EdgeInsets.only(right: k8Padding),
                                                child: Text(
                                                  item['price'],
                                                  style: p12MediumTextStyle(cWhiteColor),
                                                  textAlign: TextAlign.right,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Positioned(
                                          top: 0,
                                          right: 2,
                                          child: Text(
                                            ksTaka,
                                            style: p10RegularTextStyle(cWhiteColor),
                                            textAlign: TextAlign.end,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                : Container(
                                    width: h32,
                                    height: h16,
                                    decoration: BoxDecoration(
                                      color: cPrimaryShadeColor,
                                      borderRadius: BorderRadius.circular(k5BorderRadius),
                                    ),
                                    child: Stack(
                                      children: [
                                        Center(
                                          child: Text(
                                            item['price'],
                                            style: p12MediumTextStyle(cWhiteColor),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        Positioned(
                                          top: 0,
                                          right: 2,
                                          child: Text(
                                            ksTaka,
                                            style: p10RegularTextStyle(cWhiteColor),
                                            textAlign: TextAlign.end,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
                //*Govt. Test List in tabbar
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: _homeController.popularMockTestList.length,
                  itemBuilder: (context, index) {
                    var item = _homeController.popularMockTestList[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: k5Padding),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(k10BorderRadius),
                        child: TextButton(
                          style: kTextButtonStyle,
                          onPressed: () async {
                            // ll(index);
                          },
                          child: CustomListItems(
                            backgroundImage: AssetImage(item['image']),
                            itemTitle: item['title'],
                            subTittle1: item['examTime'],
                            subTittle2: item['rating'],
                            priceWidget: Container(
                              width: h32,
                              height: h16,
                              decoration: BoxDecoration(
                                color: cPrimaryShadeColor,
                                borderRadius: BorderRadius.circular(k5BorderRadius),
                              ),
                              child: Stack(
                                children: [
                                  Center(
                                    child: Text(
                                      item['price'],
                                      style: p12MediumTextStyle(cWhiteColor),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Positioned(
                                    top: 0,
                                    right: 2,
                                    child: Text(
                                      ksTaka,
                                      style: p10RegularTextStyle(cWhiteColor),
                                      textAlign: TextAlign.end,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
                //*private Test List in tabbar
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: _homeController.popularMockTestList.length,
                  itemBuilder: (context, index) {
                    var item = _homeController.popularMockTestList[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: k5Padding),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(k10BorderRadius),
                        child: TextButton(
                          style: kTextButtonStyle,
                          onPressed: () async {
                            // ll(index);
                          },
                          child: CustomListItems(
                            backgroundImage: AssetImage(item['image']),
                            itemTitle: item['title'],
                            subTittle1: item['examTime'],
                            subTittle2: item['rating'],
                            priceWidget: Container(
                              width: h32,
                              height: h16,
                              decoration: BoxDecoration(
                                color: cPrimaryShadeColor,
                                borderRadius: BorderRadius.circular(k5BorderRadius),
                              ),
                              child: Stack(
                                children: [
                                  Center(
                                    child: Text(
                                      item['price'],
                                      style: p12MediumTextStyle(cWhiteColor),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Positioned(
                                    top: 0,
                                    right: 2,
                                    child: Text(
                                      ksTaka,
                                      style: p10RegularTextStyle(cWhiteColor),
                                      textAlign: TextAlign.end,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
