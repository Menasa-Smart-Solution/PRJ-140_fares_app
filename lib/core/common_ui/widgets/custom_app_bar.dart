import 'package:fares/core/helpers/extensions.dart';
import 'package:fares/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.leading,
    this.title,
    this.actions,
    this.centerTitle = true,
    this.showBackButton = true,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  final Widget? leading;
  final dynamic title;
  final List<Widget>? actions;
  final bool centerTitle;
  final bool showBackButton;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      actions: actions,
      title: title is String
          ? Text(title.toString(), style: AppTextStyles.semiBold16)
          : title,
      centerTitle: centerTitle,
      actionsPadding: const EdgeInsetsDirectional.only(end: 10),
      surfaceTintColor: Colors.transparent,
      leading: leading != null || showBackButton == false
          ? null
          : InkWell(
              borderRadius: BorderRadius.circular(100),
              onTap: () {
                context.pop();
              },
              child: Container(
                width: 35,
                height: 35,
                margin: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xffF1F1F1),
                ),
                child: const Center(
                  child: Icon(Icons.arrow_back, color: Colors.black, size: 20),
                ),
              ),
            ),
    );
  }
}
