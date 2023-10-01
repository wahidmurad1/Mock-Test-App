import 'package:mock_test_app/utils/constants/imports.dart';

class HomeController extends GetxController {
 final RxList slider1ImageList = RxList(slider1ImageLists);
 final RxInt slider1CurrentIndex = RxInt(0);
 final CarouselController carouselController = CarouselController();
}
