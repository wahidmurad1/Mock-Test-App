import 'package:mock_test_app/controllers/home_controller.dart';
import 'package:mock_test_app/utils/constants/imports.dart';

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
              // height: 30,
              // width: 20,
              decoration: BoxDecoration(
                color: cWhiteColor,
                borderRadius: BorderRadius.circular(50),
              ),
              child: IconButton(
                  // padding: const EdgeInsets.only(left: k8Padding),
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
          body: SizedBox(
            width: width,
            height: height - (MediaQuery.of(context).padding.top),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: k30Padding, left: k20Padding, right: k20Padding),
                child: Column(
                  children: [
                    CommonImageSlider(
                      sliderImageList: _homeController.slider1ImageList,
                      carouselController: _homeController.carouselController,
                      currentIndex: _homeController.slider1CurrentIndex,
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}

class CommonImageSlider extends StatelessWidget {
  const CommonImageSlider({super.key, required this.sliderImageList, required this.carouselController, required this.currentIndex});
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
                viewportFraction: 1,
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
