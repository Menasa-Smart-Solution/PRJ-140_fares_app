part of '../../feature_imports.dart';

class ContactUsListView extends StatelessWidget {
  const ContactUsListView({super.key, required this.contacts});
  final List<ContactUsModel> contacts;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<AppInfoCubit>().getContactUsInfo();
      },
      child: ListView.separated(
        itemCount: contacts.length,
        separatorBuilder: (context, index) => verticalSpace(8),
        itemBuilder: (context, index) {
          final contact = contacts[index];
          return ContactItemWidget(
            name: contact.name,
            phone: contact.phone,
            phone2: contact.phone2,
            address: contact.address,
          );
        },
      ),
    );
  }
}
