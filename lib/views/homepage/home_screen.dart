import 'package:mock_test_app/utils/constants/imports.dart';
import 'package:mock_test_app/widgets/appbar/custom_appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
            child: Column(
              
            ),
          ),
        ),
      ),
    );
  }
}
