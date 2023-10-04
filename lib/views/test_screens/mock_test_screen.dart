import 'package:mock_test_app/controllers/common_controller/global_controller.dart';
import 'package:mock_test_app/utils/constants/imports.dart';

class MockTestScreen extends StatelessWidget {
  MockTestScreen({super.key});
  final GlobalController _globalController = Get.find<GlobalController>();
  // final MockTestController _mockTestController = Get.find<MockTestController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            DefaultTabController(
              length: 3,
              child: Column(
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
                      ]),

                  // Expanded(
                  //   child: TabBarView(
                  //     children: [
                  //       // Add your content for each tab here
                  //       // For example, for the "Popular" tab:
                  //       Center(child: Text("Content for Popular Tab")),
                  //       // For the "Govt" tab:
                  //       Center(child: Text("Content for Govt Tab")),
                  //       // For the "Private" tab:
                  //       Center(child: Text("Content for Private Tab")),
                  //     ],
                  //   ),
                  // ),
                  // TabBarView(children: [
                  //   Container(
                  //     width: 100,
                  //     height: 100,
                  //     color: cRedOrangeColor,
                  //   ),
                  //   Container(
                  //     width: 100,
                  //     height: 100,
                  //     color: cPrimaryColor,
                  //   ),
                  //   Container(
                  //     width: 100,
                  //     height: 100,
                  //     color: cGreenColor,
                  //   ),
                  // ]),
                ],
              ),
            ),
            // TabBarView(children: [
            //   Container(
            //     width: 100,
            //     height: 100,
            //     color: cRedOrangeColor,
            //   ),
            //   Container(
            //     width: 100,
            //     height: 100,
            //     color: cPrimaryColor,
            //   ),
            //   Container(
            //     width: 100,
            //     height: 100,
            //     color: cGreenColor,
            //   ),
            // ]),

            // TabBarView(children: [
            //   Container(
            //     width: 100,
            //     height: 100,
            //     color: cRedOrangeColor,
            //   ),
            //   Container(
            //     width: 100,
            //     height: 100,
            //     color: cPrimaryColor,
            //   ),
            //   Container(
            //     width: 100,
            //     height: 100,
            //     color: cGreenColor,
            //   ),
            // ]),
          ],
        ),
      ),
    );
  }
}
