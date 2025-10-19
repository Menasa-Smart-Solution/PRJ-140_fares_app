part of '../../feature_imports.dart';

class AddCollectionRequestView extends StatelessWidget {
  const AddCollectionRequestView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: LocaleKeys.addCollectionRequest.tr()),
      body: const AddCollectionRequestViewBody(),
    );
  }
}
