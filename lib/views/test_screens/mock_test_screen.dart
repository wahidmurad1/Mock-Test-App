import 'package:mock_test_app/controllers/common_controller/global_controller.dart';
import 'package:mock_test_app/utils/constants/imports.dart';

class MockTestScreen extends StatelessWidget {
  MockTestScreen({super.key});
  final GlobalController _globalController= Get.find<GlobalController>();
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
          closeIconOnPressed: () {
            
          },
          filterButtonOnPressed: (){},
        ),
      ),
    );
  }
}
