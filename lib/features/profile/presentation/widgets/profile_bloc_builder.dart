part of '../../feature_imports.dart';

class ProfileBlocBuilder extends StatelessWidget {
  const ProfileBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        switch (state.getUserInfo) {
          case StateType.loading:
            return Skeletonizer(
              enabled: true,
              child: ProfileViewBody(
                userModel: UserModel(
                  id: 1,
                  name: 'name',
                  address: 'address',
                  type: 'type',
                  phone2: 'phone2',
                  ownerName: 'ownerName',
                  phone: 'phone',
                ),
              ),
            );
          case StateType.success:
            return ProfileViewBody(userModel: state.userModel!);
          case StateType.error:
            return CustomErrorWidget(
              message: state.errorMessage!,
              onPressed: () {
                context.read<ProfileCubit>().getUserInfo();
              },
            );
          case StateType.noInternet:
            return InternetConnectionWidget(
              onPressed: () {
                context.read<ProfileCubit>().getUserInfo();
              },
            );
          default:
            return const SizedBox();
        }
      },
    );
  }
}
