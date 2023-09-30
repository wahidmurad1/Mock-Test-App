import 'package:mock_test_app/utils/constants/imports.dart';
import 'package:mock_test_app/views/auth/login_screen.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: cWhiteColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: k30Padding, left: k20Padding, right: k20Padding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TopRowAndImage(
                  imageLink: otpImage,
                  icon: Icons.arrow_back,
                ),
                Text(
                  ksOtpVerification.tr,
                  style: p20MediumTextStyle(cTextPrimaryColor),
                ),
                Text(
                  ksPleaseCheckSms.tr,
                  style: p12RegularTextStyle(cTextPrimaryColor),
                ),
                kH30sizedBox,
                CustomElevatedButton(
                  buttonWidth: width - 40,
                  buttonHeight: h50,
                  labelIcon: Icons.arrow_right_alt_outlined,
                  label: ksVerify.tr,
                  onPressed: () {
                    Get.toNamed(krOtpScreen);
                  },
                  textStyle: p16MediumTextStyle(cWhiteColor),
                ),
                kH50sizedBox,
                const TermsConditionText(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
