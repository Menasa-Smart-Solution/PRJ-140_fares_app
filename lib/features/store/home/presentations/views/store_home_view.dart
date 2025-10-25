import 'package:fares/core/common_ui/widgets/custom_icon_button.dart';
import 'package:fares/core/utils/exports.dart';

class StoreHomeView extends StatelessWidget {
  const StoreHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          automaticallyImplyLeading: false,
          surfaceTintColor: Colors.transparent,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          titleSpacing: 0,
          centerTitle: true,
          leading: CustomIconButton(
            onTap: () {
              //open drawer
              Scaffold.of(context).openDrawer();
            },
            icon: Icons.menu,
            color: AppColors.primaryColor,
          ),
          title: Skeleton.keep(
            child: Image.asset(
              AppImages.imagesLogoFullDark,
              width: 100,
              height: 50,
            ),
          ),
        ),
      ],
    );
  }
}
