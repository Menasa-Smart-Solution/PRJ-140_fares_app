part of '../../feature_imports.dart';

class StoreParcelsView extends StatelessWidget {
  const StoreParcelsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'كل الشحنات'),
      body: const StoreParcelsListView().withPadding(
        vertical: 20,
        horizontal: 16,
      ),
    );
  }
}
