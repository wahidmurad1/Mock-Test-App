import 'package:mock_test_app/controllers/mock_test_controller.dart';
import 'package:mock_test_app/utils/constants/imports.dart';
import 'package:mock_test_app/widgets/common/common_search_appbar.dart';

class TestScreen extends StatelessWidget {
  TestScreen({super.key});
  final MockTestController _mockTestController = Get.find<MockTestController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cWhiteColor,
      //*AppBar
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kAppBarSize),
        child: CustomSearchAppBar(
          searchBackButtonOnPressed: () {
            _mockTestController.isMockSearching.value = false;
          },
          title: ksTest,
          onChanged: (value) {},
          closeIconOnPressed: () {},
        ),
      ),
      body: Obx(
        () => SizedBox(
          width: width,
          height: height - (MediaQuery.of(context).padding.top + kAppBarSize),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(k20Padding).copyWith(bottom: k0Padding),
              child: Column(
                children: [
                  Image.asset(
                    mockTestImage,
                    width: width,
                    height: 150,
                  ),
                  kH20sizedBox,
                  CustomListViewTopRow(
                      title: ksMockTest,
                      viewAllOnPressed: () {
                        // Get.toNamed();
                      }),
                  kH10sizedBox,
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _mockTestController.mockTestArrowDownButton.value ? 5 : _mockTestController.mockTestList.length,
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
                  _mockTestController.mockTestArrowDownButton.value
                      ? IconButton(
                          padding: const EdgeInsets.only(top: k0Padding, bottom: k0Padding),
                          constraints: const BoxConstraints(),
                          onPressed: () {
                            _mockTestController.mockTestArrowDownButton.value = false;
                          },
                          icon: _mockTestController.mockTestList.length == _mockTestController.mockTestList.length
                              ? const Icon(Icons.keyboard_arrow_down_outlined)
                              : const SizedBox(),
                        )
                      : const SizedBox(),
                  kH20sizedBox,
                  CustomListViewTopRow(
                    title: ksMcqTest,
                    viewAllOnPressed: () {},
                  ),
                  kH10sizedBox,
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _mockTestController.mcqTestArrowDownButton.value ? 5 : _mockTestController.mcqTestList.length,
                    itemBuilder: (context, index) {
                      var item = _mockTestController.mcqTestList[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: k5Padding),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(k10BorderRadius),
                          child: TextButton(
                            style: kTextButtonStyle,
                            onPressed: () async {},
                            child: CustomListItems(
                              freeOrPaidWidget: CustomElevatedButton(
                                label: item['examType'],
                                onPressed: () {},
                                buttonColor: item['examType'].toString() == "Free" ? cGreenColor : cRedOrangeColor,
                                buttonWidth: h32,
                                buttonHeight: h20,
                                textStyle: p12MediumTextStyle(cWhiteColor),
                              ),
                              itemTitle: item['title'],
                              subTittle1: item['examMarks'],
                              subTittle2: item['examTime'],
                              subTittle3: item['examQuestionNumber'],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  _mockTestController.mcqTestArrowDownButton.value
                      ? IconButton(
                          padding: const EdgeInsets.only(top: k0Padding, bottom: k0Padding),
                          constraints: const BoxConstraints(),
                          onPressed: () {
                            _mockTestController.mcqTestArrowDownButton.value = false;
                          },
                          icon: _mockTestController.mcqTestList.length == _mockTestController.mcqTestList.length
                              ? const Icon(Icons.keyboard_arrow_down_outlined)
                              : const SizedBox(),
                        )
                      : const SizedBox(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}