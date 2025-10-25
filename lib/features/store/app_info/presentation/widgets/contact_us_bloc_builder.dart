part of '../../feature_imports.dart';

class ContactUsBlocBuilder extends StatelessWidget {
  const ContactUsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppInfoCubit, AppInfoState>(
      buildWhen: (previous, current) =>
          current.getContactUsState != previous.getContactUsState,
      builder: (context, state) {
        switch (state.getContactUsState) {
          case StateType.loading:
            return Skeletonizer(
              enabled: true,
              child: ContactUsListView(
                contacts: List.generate(
                  10,
                  (index) => ContactUsModel(
                    id: index,
                    name: 'Product $index',
                    phone: '+218 91-XXXXXXX',
                    phone2: '+218 92-XXXXXXX',
                    address: 'Loading...',
                  ),
                ),
              ),
            );
          case StateType.success:
            return ContactUsListView(contacts: state.contactUsInfo);
          case StateType.error:
            return CustomErrorWidget(
              message: state.errorMessage!,
              onPressed: () {
                context.read<AppInfoCubit>().getContactUsInfo();
              },
            );
          case StateType.noInternet:
            return InternetConnectionWidget(
              onPressed: () {
                context.read<AppInfoCubit>().getContactUsInfo();
              },
            );
          default:
            return const SizedBox();
        }
      },
    );
  }
}
