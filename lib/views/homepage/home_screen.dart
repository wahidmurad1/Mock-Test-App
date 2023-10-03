import 'package:mock_test_app/controllers/home_controller.dart';
import 'package:mock_test_app/utils/constants/imports.dart';
import 'package:mock_test_app/widgets/common/common_text_button.dart';
import 'package:mock_test_app/widgets/common/custom_circle_rounded_icon_button.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final HomeController _homeController = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: cWhiteColor,
          elevation: 0,
          leading: CustomRoundedCircleIconButton(
            onPress: () {},
            icon: Icons.menu,
            containerColor: cWhiteColor,
            borderColor: cWhiteColor,
            iconColor: cBlackColor,
            size: kIconSize20,
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.notifications_active_outlined,
                  color: cBlackColor,
                  size: kIconSize20,
                )),
            Padding(
              padding: const EdgeInsets.only(right: k12Padding),
              child: CustomRoundedCircleIconButton(
                onPress: () {},
                icon: Icons.person,
                containerColor: cPrimaryShadeColor,
                size: kIconSize20,
              ),
            ),
          ],
        ),
        body: Obx(() => SizedBox(
              width: width,
              height: height - (MediaQuery.of(context).padding.top),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(top: k30Padding, left: k20Padding, right: k20Padding),
                  child: Column(
                    children: [
                      CustomImageSlider(
                        sliderImageList: _homeController.slider1ImageList,
                        carouselController: _homeController.slider1carouselController,
                        currentIndex: _homeController.slider1CurrentIndex,
                      ),
                      kH15sizedBox,
                      Container(
                        width: width,
                        height: 210,
                        decoration: BoxDecoration(
                          color: cWhiteColor,
                          borderRadius: BorderRadius.circular(k10BorderRadius),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: k20Padding, horizontal: k16Padding),
                          child: Wrap(
                            alignment: WrapAlignment.start,
                            spacing: k25Padding,
                            runSpacing: k25Padding,
                            children: [
                              HomePageContainers(
                                containerColor: cRedOrangeColor,
                                icon: Icons.speaker,
                                text: ksMockTest,
                              ),
                              HomePageContainers(
                                containerColor: cGreenColor,
                                icon: Icons.radio_button_checked_outlined,
                                text: ksMcq,
                              ),
                              HomePageContainers(
                                containerColor: cSlateBlueColor,
                                icon: Icons.task_rounded,
                                text: ksWritting,
                              ),
                              HomePageContainers(
                                containerColor: cPrimaryShadeColor,
                                icon: Icons.add_task,
                                text: ksBook,
                              ),
                              HomePageContainers(
                                containerColor: cRadicalRedColor,
                                icon: Icons.speaker_notes,
                                text: ksNotes,
                              ),
                              HomePageContainers(
                                containerColor: cMediumShadeOrangeColor,
                                icon: Icons.tips_and_updates,
                                text: ksTips,
                              ),
                            ],
                          ),
                        ),
                      ),
                      kH50sizedBox,
                      ListViewTopRow(
                        title: ksPopularMockTest,
                        viewAllOnPressed: () {},
                      ),
                      kH30sizedBox,
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: _homeController.popularMockTestArrowDownButton.value ? 5 : _homeController.popularMockTestList.length,
                        itemBuilder: (context, index) {
                          var item = _homeController.popularMockTestList[index];
                          return Padding(
                            padding: const EdgeInsets.only(bottom: k10Padding),
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
                      _homeController.popularMockTestArrowDownButton.value
                          ? IconButton(
                              onPressed: () {
                                _homeController.popularMockTestArrowDownButton.value = false;
                              },
                              icon: _homeController.popularMockTestList.length == _homeController.popularMockTestList.length
                                  ? const Icon(Icons.keyboard_arrow_down_outlined)
                                  : const SizedBox(),
                            )
                          : const SizedBox(),
                      CustomImageSlider(
                        sliderImageList: _homeController.gifSliderImageList,
                        carouselController: _homeController.gifcarouselController,
                        currentIndex: _homeController.gifSliderCurrentIndex,
                      ),
                      kH50sizedBox,
                      ListViewTopRow(
                        title: ksMcqTest,
                        viewAllOnPressed: () {},
                      ),
                      kH30sizedBox,
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: _homeController.mcqTestArrowDownButton.value ? 5 : _homeController.mcqTestList.length,
                        itemBuilder: (context, index) {
                          var item = _homeController.mcqTestList[index];
                          return Padding(
                            padding: const EdgeInsets.only(bottom: k10Padding),
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
                                    textStyle: p14MediumTextStyle(cWhiteColor),
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
                      _homeController.mcqTestArrowDownButton.value
                          ? IconButton(
                              onPressed: () {
                                _homeController.mcqTestArrowDownButton.value = false;
                              },
                              icon: _homeController.popularMockTestList.length == _homeController.popularMockTestList.length
                                  ? const Icon(Icons.keyboard_arrow_down_outlined)
                                  : const SizedBox(),
                            )
                          : const SizedBox(),
                    ],
                  ),
                ),
              ),
            )),
      ),
    );
  }
}

class CustomListItems extends StatelessWidget {
  const CustomListItems(
      {super.key,
      this.backgroundImage,
      required this.itemTitle,
      required this.subTittle1,
      required this.subTittle2,
      this.subTittle3,
      this.priceWidget,
      this.freeOrPaidWidget});
  final ImageProvider<Object>? backgroundImage;
  final String itemTitle;
  final String subTittle1;
  final String subTittle2;
  final String? subTittle3;
  final Widget? priceWidget;
  final Widget? freeOrPaidWidget;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: k8Padding),
      child: Container(
        width: width,
        height: 100,
        decoration: BoxDecoration(
          color: cWhiteColor,
          borderRadius: BorderRadius.circular(k10BorderRadius),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: k20Padding),
          child: Row(
            children: [
              backgroundImage != null
                  ? CircleAvatar(
                      radius: 30,
                      backgroundColor: cBackgroundNeutralColor2,
                      backgroundImage: backgroundImage,
                    )
                  : const SizedBox(),
              backgroundImage != null ? kW30sizedBox : const SizedBox(),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  freeOrPaidWidget != null ? freeOrPaidWidget ?? const SizedBox() : const SizedBox(),
                  freeOrPaidWidget != null ? kH5sizedBox : const SizedBox(),
                  Text(
                    itemTitle,
                    style: p16MediumTextStyle(cTextPrimaryColor),
                  ),
                  kH5sizedBox,
                  Row(
                    children: [
                      Text(
                        subTittle1,
                        style: p12RegularTextStyle(cTextSecondaryColor),
                      ),
                      // kW5sizedBox,
                      const DotContainer(),
                      // kW5sizedBox,
                      Text(
                        subTittle2,
                        style: p12RegularTextStyle(cTextSecondaryColor),
                      ),
                      // subTittle3 != null ? kW5sizedBox : const SizedBox(),
                      subTittle3 != null ? const DotContainer() : const SizedBox(),
                      subTittle3 != null
                          ? Text(
                              subTittle3!,
                              style: p12RegularTextStyle(cTextSecondaryColor),
                            )
                          : const SizedBox(),
                      kW5sizedBox,
                      backgroundImage != null ? Image.asset(starImage) : const SizedBox(),
                      kW10sizedBox,
                      priceWidget ?? const SizedBox(),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              const Icon(
                Icons.arrow_circle_right_outlined,
                color: cIconColor,
                size: kIconSize20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DotContainer extends StatelessWidget {
  const DotContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 4,
      height: 4,
      margin: const EdgeInsets.symmetric(horizontal: k5Padding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(k10BorderRadius),
        color: cGreenColor,
      ),
    );
  }
}

class CustomImageSlider extends StatelessWidget {
  const CustomImageSlider({super.key, required this.sliderImageList, required this.carouselController, required this.currentIndex});
  final List sliderImageList;
  final CarouselController carouselController;
  final RxInt currentIndex;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: () {},
          child: CarouselSlider(
            items: sliderImageList.map((element) => Image.asset(element['image'])).toList(),
            carouselController: carouselController,
            options: CarouselOptions(
                scrollPhysics: const BouncingScrollPhysics(),
                autoPlay: true,
                aspectRatio: 2,
                disableCenter: true,
                viewportFraction: 1,
                enlargeCenterPage: false,
                onPageChanged: (index, reason) {
                  currentIndex.value = index;
                }),
          ),
        ),
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: Obx(() => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: sliderImageList.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => carouselController.animateToPage(entry.key),
                  child: Container(
                    width: 8,
                    height: 8,
                    margin: const EdgeInsets.symmetric(horizontal: k5Padding),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(k10BorderRadius),
                      color: currentIndex.value == entry.key ? cPrimaryColor : cBackgroundNeutralColor2,
                    ),
                  ),
                );
              }).toList())),
        ),
      ],
    );
  }
}

class HomePageContainers extends StatelessWidget {
  const HomePageContainers({super.key, required this.containerColor, required this.text, required this.icon});
  final Color containerColor;
  final IconData icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: containerColor,
            borderRadius: BorderRadius.circular(90),
          ),
          child: Icon(
            icon,
            color: cWhiteColor,
            size: kIconSize24,
          ),
        ),
        kH8sizedBox,
        Text(
          text,
          style: p12RegularTextStyle(cTextPrimaryColor),
        ),
      ],
    );
  }
}

class ListViewTopRow extends StatelessWidget {
  const ListViewTopRow({super.key, required this.title, required this.viewAllOnPressed});
  final String title;
  final VoidCallback viewAllOnPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: p16MediumTextStyle(cTextPrimaryColor),
        ),
        CustomTextButton(
          text: ksViewAll,
          textStyle: p12RegularTextStyle(cPrimaryColor),
          onPressed: viewAllOnPressed,
          isIconExits: true,
        ),
      ],
    );
  }
}
