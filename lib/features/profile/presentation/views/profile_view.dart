part of '../../feature_imports.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "الحساب"),
      body: const ProfileViewBody().withPadding(horizontal: 16, vertical: 20),
    );
  }
}
