import 'package:mock_test_app/controllers/home_controller.dart';
import 'package:mock_test_app/utils/constants/imports.dart';
import 'package:mock_test_app/widgets/common/common_text_button.dart';

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
          leading: Container(
            decoration: BoxDecoration(
              color: cWhiteColor,
              borderRadius: BorderRadius.circular(90),
            ),
            child: IconButton(
                constraints: const BoxConstraints(),
                onPressed: () {},
                icon: const Icon(
                  Icons.menu,
                  size: kIconSize20,
                  color: cBlackColor,
                )),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.notifications_active_outlined,
                  color: cBlackColor,
                  size: kIconSize20,
                )),
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
                                containerColor: cRadicalRedColor,
                                icon: Icons.speaker_notes,
                                text: ksNotes,
                              ),
                              HomePageContainers(
                                containerColor: cGreenColor,
                                icon: Icons.radio_button_checked_outlined,
                                text: ksMcq,
                              ),
                              // kH20sizedBox,
                              HomePageContainers(
                                containerColor: cMediumShadeOrangeColor,
                                icon: Icons.tips_and_updates,
                                text: ksTips,
                              ),
                              HomePageContainers(
                                containerColor: cSlateBlueColor,
                                icon: Icons.task_rounded,
                                text: ksWritting,
                              ),
                              HomePageContainers(
                                containerColor: cVividBlueColor,
                                icon: Icons.add_task,
                                text: ksBook,
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
                        itemCount: _homeController.popularMockTestArrowDown.value
                            ? _homeController.popularMockTestList.length
                            : 5, //_hrController.filteredVisitorList.length,
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
                                  examTime: item['examTime'],
                                  ratingValue: item['rating'],
                                  widget: Container(
                                    width: h32,
                                    height: h16,
                                    decoration: BoxDecoration(
                                      color: cPrimaryColor,
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
                      IconButton(
                        onPressed: () {
                          _homeController.popularMockTestArrowDown.value = true;
                        },
                        icon: _homeController.popularMockTestList.length == _homeController.popularMockTestList.length
                            ? const Icon(Icons.keyboard_arrow_down_outlined)
                            : const SizedBox(),
                      ),
                      CustomImageSlider(
                        sliderImageList: _homeController.gifSliderImageList,
                        carouselController: _homeController.gifcarouselController,
                        currentIndex: _homeController.gifSliderCurrentIndex,
                      ),
                      kH50sizedBox,
                    ],
                  ),
                ),
              ),
            )),
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
            size: kIconSize30,
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

class CustomListItems extends StatelessWidget {
  const CustomListItems({super.key, this.backgroundImage, required this.itemTitle, required this.examTime, required this.ratingValue, required this.widget});
  final ImageProvider<Object>? backgroundImage;
  final String itemTitle;
  final String examTime;
  final String ratingValue;
  final Widget widget;
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
              CircleAvatar(
                radius: 30,
                backgroundColor: cBackgroundNeutralColor2,
                backgroundImage: backgroundImage,
              ),
              kW30sizedBox,
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    itemTitle,
                    style: p16MediumTextStyle(cTextPrimaryColor),
                  ),
                  kH10sizedBox,
                  Row(
                    children: [
                      Text(
                        examTime,
                        style: p12RegularTextStyle(cTextSecondaryColor),
                      ),
                      kW5sizedBox,
                      Container(
                        width: 4,
                        height: 4,
                        margin: const EdgeInsets.symmetric(horizontal: k5Padding),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(k10BorderRadius),
                          color: cGreenColor,
                        ),
                      ),
                      kW5sizedBox,
                      Text(
                        ratingValue,
                        style: p12RegularTextStyle(cTextSecondaryColor),
                      ),
                      kW5sizedBox,
                      Image.asset(starImage),
                      kW10sizedBox,
                      widget,
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
