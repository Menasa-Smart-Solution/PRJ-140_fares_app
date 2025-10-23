part of '../../../feature_imports.dart';

class StoreParcelsListView extends StatelessWidget {
  const StoreParcelsListView({super.key, required this.storeParcels});
  final List<StoreParcelModel> storeParcels;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) =>
          StoreParcelsItem(storeParcelModel: storeParcels[index]),
      separatorBuilder: (context, index) => verticalSpace(8),
      itemCount: storeParcels.length,
    );
  }
}
