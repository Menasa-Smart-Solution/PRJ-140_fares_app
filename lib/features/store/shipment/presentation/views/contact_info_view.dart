part of '../../feature_imports.dart';

class ContactInfoView extends StatelessWidget {
  const ContactInfoView({super.key});

  static const List<Map<String, dynamic>> _addresses = [
    {'address': 'طرابلس - قرقارش أبونواس', 'icon': Icons.location_on},
    {'address': 'طرابلس - سوق الجمعة - الحشان', 'icon': Icons.location_on},
    {
      'address': 'طرابلس - عمر المختار - شارع المعرى',
      'icon': Icons.location_on,
    },
  ];

  static const List<String> _phoneNumbers = [
    '0942673000',
    '0942683000',
    '0942693000',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'معلومات التواصل'),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: verticalSpace(16)),
          const SliverToBoxAdapter(
            child: CustomFadeInDown(duration: 400, child: ContactInfoHeader()),
          ),
          SliverToBoxAdapter(child: verticalSpace(20)),
          const SliverToBoxAdapter(
            child: CustomFadeInUp(
              duration: 500,
              child: AddressesSection(addresses: _addresses),
            ),
          ),
          SliverToBoxAdapter(child: verticalSpace(16)),
          const SliverToBoxAdapter(
            child: CustomFadeInUp(
              duration: 600,
              child: PhoneNumbersSection(phoneNumbers: _phoneNumbers),
            ),
          ),
          SliverToBoxAdapter(child: verticalSpace(24)),
        ],
      ),
    );
  }
}
