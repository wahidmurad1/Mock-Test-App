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
                    kH15sizedBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        HomePageContainers(
                          containerColor: Colors.red,
                          icon: Icons.speaker,
                          text: 'Hi',
                        ),
                        HomePageContainers(
                          containerColor: Colors.red,
                          icon: Icons.task_rounded,
                          text: 'Hi',
                        ),
                        HomePageContainers(
                          containerColor: Colors.red,
                          icon: Icons.task_rounded,
                          text: 'Hi',
                        ),
                        HomePageContainers(
                          containerColor: Colors.red,
                          icon: Icons.add_task,
                          text: 'Hi',
                        ),
                      ],
                    ),
                    kH20sizedBox,
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        HomePageContainers(
                          containerColor: Colors.red,
                          icon: Icons.task_rounded,
                          text: 'Hi',
                        ),
                        SizedBox(
                          width: 42,
                        ),
                        HomePageContainers(
                          containerColor: Colors.red,
                          icon: Icons.add_task,
                          text: 'Hi',
                        ),
                      ],
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
