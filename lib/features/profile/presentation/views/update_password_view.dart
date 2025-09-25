part of '../../feature_imports.dart';

class UpdatePasswordView extends StatelessWidget {
  const UpdatePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: const UpdatePasswordViewBody().withPadding(
        horizontal: 16,
        vertical: 20,
      ),
    );
  }
}
