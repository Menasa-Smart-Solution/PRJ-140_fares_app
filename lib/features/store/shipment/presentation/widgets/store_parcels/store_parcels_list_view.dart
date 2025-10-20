part of '../../../feature_imports.dart';

class StoreParcelsListView extends StatelessWidget {
  const StoreParcelsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => const StoreParcelsItem(),
      separatorBuilder: (context, index) => verticalSpace(8),
      itemCount: 10,
    );
  }
}
