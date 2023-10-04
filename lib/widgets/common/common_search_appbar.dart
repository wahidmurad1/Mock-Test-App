import 'package:mock_test_app/controllers/mock_test_controller.dart';
import 'package:mock_test_app/utils/constants/imports.dart';

class CustomSearchAppBar extends StatelessWidget {
  CustomSearchAppBar({super.key, required this.title, required this.onChanged, required this.closeIconOnPressed, required this.searchBackButtonOnPressed});
  final String title;
  final MockTestController _mockTestController = Get.find<MockTestController>();
  final Function(String) onChanged;
  final VoidCallback closeIconOnPressed;
  final VoidCallback searchBackButtonOnPressed;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => _mockTestController.isMockSearching.value ? buildSearchAppBar() : buildInitialAppBar(),
    );
  }

  Widget buildInitialAppBar() {
    return AppBar(
      backgroundColor: cWhiteColor,
      elevation: 0,
      leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: cBlackColor,
            size: kIconSize16,
          )),
      centerTitle: true,
      title: Text(
        title,
        style: p16MediumTextStyle(cTextPrimaryColor),
      ),
      actions: [
        IconButton(
          icon: const Icon(
            Icons.search,
            size: kIconSize16,
            color: cBlackColor,
          ),
          onPressed: () {
            _mockTestController.isMockSearching.value = true;
            _mockTestController.mockSearchController.clear();
            // _hrController.searchValue.value = '';
          },
        ),
      ],
    );
  }

  Widget buildSearchAppBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(kAppBarSize),
      child: AppBar(
        titleSpacing: 0.0,
        leadingWidth: 0,
        backgroundColor: cWhiteColor,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(bottom: k20Padding, left: k10Padding),
          child: SizedBox(
            width: width,
            child: TextField(
              controller: _mockTestController.mockSearchController,
              decoration: InputDecoration(
                prefixIcon: IconButton(
                  padding: const EdgeInsets.only(top: k20Padding, right: k10Padding),
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: cBlackColor,
                    size: kIconSize16,
                  ),
                  onPressed: searchBackButtonOnPressed,
                ),
                suffixIcon: IconButton(
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  icon: const Icon(Icons.close),
                  iconSize: kIconSize14,
                  onPressed: closeIconOnPressed,
                  // padding: const EdgeInsets.only(top: k20Padding, right: k10Padding),
                  // icon: const Icon(
                  //   Icons.close,
                  //   size: h18,
                  // ),
                  // onPressed: onPressed,
                ),
                hintText: ksSearching.tr,
                contentPadding: const EdgeInsets.only(top: k20Padding, right: k10Padding, left: k0Padding),
              ),
              onChanged: onChanged,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.search,
              color: cBlackColor,
              size: kIconSize16,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
