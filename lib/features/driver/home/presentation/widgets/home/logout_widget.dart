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
          final cubit = context.read<StoreHomeCubit>();
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) => BlocProvider.value(
              value: cubit,
              child: LogoutAlertDialog(
                onTap: () {
                  cubit.logout();
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
