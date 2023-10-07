import 'package:mock_test_app/controllers/mock_test_controller.dart';
import 'package:mock_test_app/utils/constants/imports.dart';
import 'package:mock_test_app/widgets/appbar/custom_appbar.dart';

class MockTestDetailsScreen extends StatelessWidget {
  MockTestDetailsScreen({super.key});
  final MockTestController _mockTestController = Get.find<MockTestController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cWhiteColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kAppBarSize),
        child: CustomAppBar(
            title: _mockTestController.popularMockTestMap['title'],
            hasBackButton: true,
            icon: Icons.arrow_back_ios,
            onPressed: () {
              Get.back();
            },
            onBack: () {
              Get.back();
            }),
      ),
      body: SizedBox(
        width: width,
        height: height - (MediaQuery.of(context).padding.top + kAppBarSize),
        child: Padding(
          padding: const EdgeInsets.all(k20Padding).copyWith(bottom: k0Padding),
          child: Column(
            children: [
              Image.asset(bcsImage),
            ],
          ),
        ),
      ),
    );
  }
}
