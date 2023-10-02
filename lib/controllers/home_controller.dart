import 'package:mock_test_app/utils/constants/imports.dart';

class HomeController extends GetxController {
  //*image Slider
  final RxList slider1ImageList = RxList(slider1ImageLists);
  final RxInt slider1CurrentIndex = RxInt(0);
  final CarouselController slider1carouselController = CarouselController();
  //*popular Mock test
  final RxList popularMockTestList = RxList(popularMockTestLists);
  //*arrow down button
  final RxBool popularMockTestArrowDown = RxBool(false);
  //*Gif image slider
  final RxList gifSliderImageList = RxList(gifSliderImageLists);
  final RxInt gifSliderCurrentIndex = RxInt(0);
  final CarouselController gifcarouselController = CarouselController();
}
