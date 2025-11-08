part of '../../feature_imports.dart';

class StoreParcelsView extends StatelessWidget {
  const StoreParcelsView({super.key, required this.params});
  final StoreParcelsParams params;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<StoreParcelsCubit>()..getStoreParcels(status: params.id),
      child: Scaffold(
        appBar: CustomAppBar(title: params.name),
        body: Column(
          children: [
            StoreParcelsSearchField(status: params.id),
            verticalSpace(12),
            Expanded(child: StoreParcelsBlocBuilder(status: params.id)),
          ],
        ).withPadding(vertical: 20, horizontal: 16),
      ),
    );
  }
}

class StoreParcelsParams {
  final String name;
  final String? id;

  StoreParcelsParams({required this.name, this.id});
}
