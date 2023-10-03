import 'package:mock_test_app/utils/constants/imports.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    Key? key,
    this.title,
    this.subtitle,
    this.onPressed,
    this.leading,
    this.trailing,
    this.itemColor = cWhiteColor,
    this.borderColor,
    this.padding,
    this.spacing = 5,
    this.alignLeadingWithTitle = false,
  }) : super(key: key);

  final dynamic title, subtitle;
  final Function()? onPressed;
  final dynamic leading, trailing;
  final Color itemColor;
  final Color? borderColor;
  final bool alignLeadingWithTitle;
  final EdgeInsetsGeometry? padding;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minHeight: height > kSmallDeviceSizeLimit ? 45 : 40),
      decoration: BoxDecoration(
        color: itemColor,
        border: Border.all(color: borderColor ?? itemColor),
        borderRadius: k10CircularBorderRadius,
      ),
      width: width,
      child: ClipRRect(
        borderRadius: k10CircularBorderRadius,
        child: TextButton(
          style: kTextButtonStyle,
          onPressed: onPressed,
          child: Padding(
            padding: padding ?? const EdgeInsets.symmetric(horizontal: k10Padding, vertical: k5Padding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: alignLeadingWithTitle ? CrossAxisAlignment.start : CrossAxisAlignment.center,
              children: [
                if (leading != null)
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: leading!,
                  ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (title != null)
                        (title is String)
                            ? Text(
                                title,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: p14MediumTextStyle(itemColor == cPrimaryColor ? cWhiteColor : cBlackColor),
                              )
                            : title,
                      if (subtitle != null)
                        Padding(
                          padding: EdgeInsets.only(top: spacing),
                          child: (subtitle is String)
                              ? Text(
                                  subtitle,
                                  overflow: TextOverflow.ellipsis,
                                  style: p12RegularTextStyle(itemColor == cPrimaryColor ? cWhiteColor : cBlackColor),
                                )
                              : subtitle,
                        ),
                    ],
                  ),
                ),
                if (trailing != null)
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: trailing is IconData
                        ? Icon(
                            trailing!,
                            color: itemColor == cPrimaryColor ? cWhiteColor : cBlackColor,
                            size: height > kSmallDeviceSizeLimit ? kIconSize20 : kIconSize16,
                          )
                        : trailing!,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
