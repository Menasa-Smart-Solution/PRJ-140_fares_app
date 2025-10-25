part of '../../feature_imports.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProfileCubit>()..getUserInfo(),
      child: Scaffold(
        appBar: const CustomAppBar(title: "الحساب"),
        body: const ProfileBlocBuilder().withPadding(
          horizontal: 16,
          vertical: 20,
        ),
      ),
    );
  }
}
