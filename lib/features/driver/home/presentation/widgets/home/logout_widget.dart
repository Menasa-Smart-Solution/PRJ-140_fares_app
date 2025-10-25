part of '../widgets.dart';

class LogoutWidget extends StatelessWidget {
  const LogoutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: DrawerItem(
        title: LocaleKeys.logout.tr(),
        imagePath: AppImages.imagesLogout,
        textColor: AppColors.lightRed,
        hoverColor: AppColors.grey200,
        onTap: () {
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) => BlocProvider(
              create: (context) => getIt<HomeCubit>(),
              child: const LogoutAlertDialog(),
            ),
          );
        },
      ),
    );
  }
}
