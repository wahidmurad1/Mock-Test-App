import 'package:mock_test_app/utils/constants/imports.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          SizedBox(
            height: 100,
            child: DrawerHeader(
              decoration: const BoxDecoration(
                color: cWhiteColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(0),
                  topRight: Radius.circular(0),
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: ListView(
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: k20Padding),
                      child: Row(
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  width: 2,
                                  color: cPrimaryColor,
                                )),
                            child: Image.asset(otpImage),
                          ),
                          kW20sizedBox,
                          Align(
                            alignment: Alignment.topCenter,
                            child: Text(
                              'Wahid Murad',
                              style: p16MediumTextStyle(cTextPrimaryColor),
                            ),
                          ),
                          const Spacer(),
                          const Icon(
                            Icons.keyboard_arrow_right_outlined,
                            size: kIconSize16,
                            color: cBlackColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                  //  const Padding(
                  //     padding:  EdgeInsets.only(right: 20, top: 10),
                  //     child: Align(
                  //       alignment: Alignment.topRight,
                  //       child: Icon(
                  //         Icons.verified,
                  //         color: Colors.blue,
                  //       ),
                  //     ),
                  //   ),
                ],
              ),
              // }),
            ),
          ),
          const CustomListTileForDrawer(
            icon: Icons.graphic_eq_outlined,
            title: ksTests,
          ),
          const CustomListTileForDrawer(
            icon: Icons.calendar_month,
            title: ksSchedule,
          ),
          const CustomListTileForDrawer(
            icon: Icons.feed_outlined,
            title: ksReward,
          ),
          const CustomListTileForDrawer(
            icon: Icons.payment,
            title: ksPayment,
          ),
          const CustomListTileForDrawer(
            icon: Icons.settings,
            title: ksSettings,
          ),
          const CustomListTileForDrawer(
            icon: Icons.feedback_rounded,
            title: ksFAQ,
          ),
          const CustomListTileForDrawer(
            icon: Icons.message_outlined,
            title: ksSupport,
          ),
          CustomElevatedButton(
            label: ksLogout,
            onPressed: () {},
            buttonHeight: h40,
            labelIcon: Icons.logout,
            buttonColor: cRedColor,
            textStyle: p16MediumTextStyle(cWhiteColor),
          ),
        ],
      ),
    );
  }
}

class CustomListTileForDrawer extends StatelessWidget {
  const CustomListTileForDrawer({super.key, required this.icon, required this.title});
  final IconData icon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        title,
        style: p14RegularTextStyle(cTextPrimaryColor),
      ),
    );
  }
}
