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
      body: SizedBox(
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
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
