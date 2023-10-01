import 'package:mock_test_app/utils/constants/imports.dart';
import 'package:mock_test_app/widgets/common/custom_circle_rounded_icon_button.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
    this.title,
    this.action,
    this.hasBackButton = true,
    required this.onBack,
  }) : super(key: key);

  final dynamic title;
  final List<Widget>? action;
  final Function()? onBack;
  final bool hasBackButton;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: k20Padding),
      child: AppBar(
        automaticallyImplyLeading: false,
        elevation: kCommonElevation,
        backgroundColor: cTransparentColor,
        leadingWidth: kCommonBackSpace + k20Padding,
        centerTitle: true,
        title: title == null
            ? null
            : (title is String)
                ? Text(
                    title,
                    style: h3TextStyle(cTextPrimaryColor),
                  )
                : title,
        leading: hasBackButton
            ? Padding(
                padding: const EdgeInsets.only(left: k20Padding),
                child: Center(
                  child: CustomRoundedCircleIconButton(
                    onPress: onBack,
                    iconColor: cTextPrimaryColor,
                    // (Theme.of(context).platform == TargetPlatform.iOS) ? PriceBondIcons.arrowLeft : PriceBondIcons.arrowRight,
                    icon: Icons.menu,
                  ),
                ),
              )
            : null,
        actions: action,
      ),
    );
  }
}
