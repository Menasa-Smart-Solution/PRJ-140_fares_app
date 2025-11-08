part of '../../feature_imports.dart';

class AddCollectionRequestView extends StatelessWidget {
  const AddCollectionRequestView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CreateStoreCollectCubit>(),
      child: Scaffold(
        appBar: CustomAppBar(title: LocaleKeys.addCollectionRequest.tr()),
        body: const AddCollectionRequestViewBody(),
      ),
    );
  }
}
