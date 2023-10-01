import 'package:mock_test_app/utils/constants/imports.dart';

class CustomRoundedCircleIconButton extends StatelessWidget {
  const CustomRoundedCircleIconButton({
    Key? key,
    required this.onPress,
    required this.icon,
    this.iconColor = cTextSecondaryColor,
    this.borderColor = cTextSecondaryColor,
    this.size,
    this.containerColor,
  }) : super(key: key);

  final Function()? onPress;
  final IconData? icon;
  final Color iconColor, borderColor;
  final double? size;
  final Color? containerColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height > kSmallDeviceSizeLimit ? 60 : 55,
      width: height > kSmallDeviceSizeLimit ? 60 : 55,
      decoration: BoxDecoration(
          color: containerColor ?? cWhiteColor,
          shape: BoxShape.circle,
          border: Border.all(
            color: borderColor,
          )),
      child: ClipOval(
        child: TextButton(
          style: kTextButtonStyle,
          onPressed: onPress,
          child: Icon(
            icon,
            size: (size != null) ? size : null,
            color: iconColor,
          ),
        ),
      ),
    );
  }
}
