import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:mock_test_app/controllers/auth/auth_controller.dart';
import 'package:mock_test_app/utils/constants/imports.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final AuthController _authController = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      // top: false,
      child: Scaffold(
        backgroundColor: cWhiteColor,
        body: Obx(
          () => SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: k30Padding, left: k20Padding, right: k20Padding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.end,
                  //   children: [
                  //     const Icon(
                  //       Icons.light_mode_outlined,
                  //       size: kIconSize24,
                  //     ),
                  //     kW15sizedBox,
                  //     CustomElevatedButton(
                  //       label: ksEn.tr,
                  //       buttonWidth: h40,
                  //       buttonHeight: h28,
                  //       onPressed: () {},
                  //       textStyle: p18RegularTextStyle(cWhiteColor),
                  //     ),
                  //   ],
                  // ),
                  // Image.asset(
                  //   loginImage,
                  //   height: 280,
                  // ),
                  const TopRowAndImage(imageLink: loginImage),
                  Text(
                    ksEnterNumber.tr,
                    style: p20MediumTextStyle(cTextPrimaryColor),
                  ),

                  IntlPhoneField(
                    controller: _authController.phoneNumberController,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                    ],
                    onChanged: (value) {
                      _authController.phoneNumber.value = value.number.toString().trim();
                      if (_authController.phoneNumber.value.length == 10) {
                        _authController.isPhoneNumberFilled.value = true;
                      } else {
                        _authController.isPhoneNumberFilled.value = false;
                      }
                    },
                    decoration: InputDecoration(
                      suffixIcon: _authController.isPhoneNumberFilled.value ? const Icon(Icons.turn_right_outlined) : null,
                    ),
                    initialCountryCode: 'BD',
                  ),
                  // IconButton(
                  //     onPressed: () {
                  //       showCountryPicker(
                  //         context: context,
                  //         showPhoneCode: true, // optional. Shows phone code before the country name.
                  //         onSelect: (Country country) {
                  //           print('Select country: ${country.displayName}');
                  //         },
                  //       );
                  //     },
                  //     icon: Icon(Icons.arrow_drop_down_rounded)),
                  kH10sizedBox,
                  CustomElevatedButton(
                    buttonWidth: width - 40,
                    buttonHeight: h50,
                    labelIcon: Icons.arrow_right_alt_outlined,
                    label: ksNext.tr,
                    onPressed: _authController.isPhoneNumberFilled.value
                        ? () {
                            Get.toNamed(krOtpScreen);
                          }
                        : null,
                    textStyle: p16MediumTextStyle(cWhiteColor),
                  ),
                  const TermsConditionText(),

                  // Column(
                  //   crossAxisAlignment: CrossAxisAlignment.center,
                  //   children: [
                  //     RichText(
                  //       text: TextSpan(
                  //         style: p12RegularTextStyle(cTextPrimaryColor),
                  //         children: [
                  //           TextSpan(
                  //             text: '${ksByBecomeAMember.tr}\n',
                  //             style: p12RegularTextStyle(cTextSecondaryColor),
                  //           ),
                  //           const TextSpan(
                  //             text: ksTermsAndConditions,
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TermsConditionText extends StatelessWidget {
  const TermsConditionText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: k16Padding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
              ksByBecomeAMember.tr,
              style: p12MediumTextStyle(cTextSecondaryColor),
            ),
          ),
          Center(
            child: Text(
              ksTermsAndConditions.tr,
              style: p12MediumTextStyle(cTextPrimaryColor),
            ),
          ),
        ],
      ),
    );
  }
}

class TopRowAndImage extends StatelessWidget {
  const TopRowAndImage({super.key, required this.imageLink, this.icon});
  final String imageLink;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // Align(alignment: Alignment.topLeft, child: Icon(icon)),
            const Icon(
              Icons.light_mode_outlined,
              size: kIconSize24,
            ),
            kW15sizedBox,
            CustomElevatedButton(
              label: ksEn.tr,
              buttonWidth: h40,
              buttonHeight: h28,
              onPressed: () {},
              textStyle: p18RegularTextStyle(cWhiteColor),
            ),
          ],
        ),
        Image.asset(
          imageLink,
          height: 280,
        )
      ],
    );
  }
}
