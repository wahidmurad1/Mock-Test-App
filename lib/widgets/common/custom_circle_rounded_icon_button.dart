import 'package:mock_test_app/utils/constants/imports.dart';

class CustomRoundedCircleIconButton extends StatelessWidget {
  const CustomRoundedCircleIconButton({
    Key? key,
    required this.onPress,
    required this.icon,
    this.iconColor,
    this.borderColor,
    this.size,
    this.containerColor,
  }) : super(key: key);

  final Function()? onPress;
  final IconData? icon;
  final Color? iconColor, borderColor;
  final double? size;
  final Color? containerColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height > kSmallDeviceSizeLimit ? 25 : 20,
      width: height > kSmallDeviceSizeLimit ? 25 : 20,
      decoration: BoxDecoration(
          color: containerColor ?? cWhiteColor,
          shape: BoxShape.circle,
          border: Border.all(
            color: borderColor ?? cTextSecondaryColor,
          )),
      child: ClipOval(
        child: TextButton(
          style: kTextButtonStyle,
          onPressed: onPress,
          child: Icon(
            icon,
            size: (size != null) ? size : null,
            color: iconColor ?? cWhiteColor,
          ),
        ),
      ),
    );
  }
}
