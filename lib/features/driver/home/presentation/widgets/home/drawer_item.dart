part of '../widgets.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({
    super.key,
    required this.title,
    required this.imagePath,
    this.textColor,
    this.hoverColor,
    this.onTap,
  });
  final String title;
  final String imagePath;
  final Color? textColor;
  final Color? hoverColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      splashColor: hoverColor ?? AppColors.lightPrimaryColor,
      leading: SvgPicture.asset(imagePath),
      title: Text(
        title,
        style: AppTextStyles.med16.copyWith(
          color: textColor ?? AppColors.white,
        ),
      ),
      onTap: onTap ?? () {},
    );
  }
}
