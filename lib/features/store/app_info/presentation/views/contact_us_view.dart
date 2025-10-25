part of '../../feature_imports.dart';

class ContactUsView extends StatelessWidget {
  const ContactUsView({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy data - replace with actual data from Cubit/API
    final contacts = [
      {
        "name": "البيضاء",
        "phone": "+218 91-8388251",
        "phone_2": "+218 91-8388251",
        "address": "البيضاء",
      },
      {
        "name": "طرابلس",
        "phone": "+218 91-1234567",
        "phone_2": "+218 92-7654321",
        "address": "شارع الجمهورية، طرابلس",
      },
      {
        "name": "بنغازي",
        "phone": "+218 91-9876543",
        "phone_2": null,
        "address": "شارع جمال عبد الناصر، بنغازي",
      },
    ];

    return Scaffold(
      appBar: CustomAppBar(title: LocaleKeys.contactUs.tr()),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: verticalSpace(16)),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverList.builder(
              itemCount: contacts.length,
              itemBuilder: (context, index) {
                final contact = contacts[index];
                return ContactItemWidget(
                  name: contact['name'] as String,
                  phone: contact['phone'] as String,
                  phone2: contact['phone_2'],
                  address: contact['address'] as String,
                );
              },
            ),
          ),
          SliverToBoxAdapter(child: verticalSpace(20)),
        ],
      ),
    );
  }
}
