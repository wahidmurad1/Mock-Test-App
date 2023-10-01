import 'package:mock_test_app/controllers/auth/auth_controller.dart';
import 'package:mock_test_app/utils/constants/imports.dart';
import 'package:mock_test_app/views/auth/login_screen.dart';
import 'package:mock_test_app/widgets/alert_dialog/common_alert_dialog.dart';
import 'package:mock_test_app/widgets/common/auth/auth_linkup_textrow.dart';
import 'package:mock_test_app/widgets/common/auth/count_down.dart';
import 'package:mock_test_app/widgets/common/auth/otp_textfield.dart';

class OTPScreen extends StatelessWidget {
  OTPScreen({super.key});
  final AuthController _authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: cWhiteColor,
        body: Obx(
          () => SizedBox(
            width: width,
            height: height - MediaQuery.of(context).padding.top,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: k30Padding, left: k20Padding, right: k20Padding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TopRowAndImage(
                        imageLink: otpImage,
                        icon: Icons.arrow_back_ios,
                        backOnPressed: () {
                          Get.back();
                        }),
                    Text(
                      ksOtpVerification.tr,
                      style: p20MediumTextStyle(cTextPrimaryColor),
                    ),
                    Text(
                      '${ksPleaseCheckSms.tr}: (${_authController.countryCode.value + _authController.phoneNumber.value})',
                      style: p12RegularTextStyle(cTextPrimaryColor),
                    ),
                    kH30sizedBox,
                    OtpTextField(
                      controller: _authController.otpTextEditingController,
                      onChange: (v) {
                        _authController.checkCanOTPVerifyNow();
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _authController.isOTPResendClick.value
                            ? LinkupTextRow(
                                prefix: ksDontRecieveCode,
                                suffix: ksResendCode.tr,
                                onPressed: () async {
                                  _authController.isOTPResendClick.value = false;
                                },
                              )
                            : CountDown(
                                seconds: 120,
                                onEnd: () {
                                  _authController.isOTPResendClick.value = true;
                                },
                              ),
                      ],
                    ),
                    kH20sizedBox,
                    CustomElevatedButton(
                      buttonWidth: width - 40,
                      buttonHeight: h50,
                      labelIcon: Icons.arrow_right_alt_outlined,
                      label: ksVerify.tr,
                      onPressed: _authController.canOTPVerifyNow.value
                          ? () {
                              verifiedAlertDialog(context);
                            }
                          : null,
                      textStyle: p16MediumTextStyle(cWhiteColor),
                    ),
                    // kH20sizedBox,
                    const TermsConditionText(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void verifiedAlertDialog([context]) {
  showAlertDialog(
    context: context,
    child: CommonAlertDialog(
      addContent: SizedBox(
        height: 100,
        width: width - 200,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: k15Padding),
          child: Column(
            children: [
              const Icon(
                Icons.verified_user_outlined,
                size: kIconSize50,
                color: cPrimaryColor,
              ),
              Text(
                ksVerified.tr,
                textAlign: TextAlign.center,
                style: p14MediumTextStyle(cPrimaryColor),
              ),
            ],
          ),
        ),
      ),
      actions: [
        CustomElevatedButton(
          buttonWidth: width * .5,
          label: ksNext.tr,
          buttonColor: cPrimaryColor,
          onPressed: () async {
            Get.toNamed(krHomeScreen);
          },
        ),
        kH10sizedBox,
      ],
      hasCloseBtn: true,
      onClose: () => Get.back(),
    ),
  );
}
