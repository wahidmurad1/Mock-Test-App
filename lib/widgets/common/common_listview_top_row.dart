import 'package:mock_test_app/utils/constants/imports.dart';

class ListViewTopRow extends StatelessWidget {
  const ListViewTopRow({super.key, required this.title, required this.viewAllOnPressed});
  final String title;
  final VoidCallback viewAllOnPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: p16MediumTextStyle(cTextPrimaryColor),
        ),
        CustomTextButton(
          text: ksViewAll,
          textStyle: p12RegularTextStyle(cPrimaryColor),
          onPressed: viewAllOnPressed,
          isIconExits: true,
        ),
      ],
    );
  }
}