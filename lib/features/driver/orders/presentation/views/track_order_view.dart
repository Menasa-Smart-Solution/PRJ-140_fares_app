part of '../../feature_imports.dart';

class TrackOrderView extends StatelessWidget {
  const TrackOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: const TrackOrderViewBody().withPadding(
        vertical: 20,
        horizontal: 16,
      ),
    );
  }

  CustomAppBar _buildAppBar() {
    return CustomAppBar(
      title: LocaleKeys.trackOrder.tr(),
      actions: const [OrderMenu()],
    );
  }
}
