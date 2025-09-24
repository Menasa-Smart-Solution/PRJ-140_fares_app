part of '../../../feature_imports.dart';

class OrderMenu extends StatefulWidget {
  const OrderMenu({super.key});

  @override
  State<OrderMenu> createState() => _OrderMenuState();
}

class _OrderMenuState extends State<OrderMenu> {
  final List<String> options = [
    "الاتصال بالمسلتم",
    "واتساب",
    "محادثه المتجر",
    "طلب الموقع",
  ];
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(
          AppColors.primaryColor.withAlpha(15),
        ),
      ),

      icon: Icon(Icons.more_horiz, color: AppColors.black),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      itemBuilder: (context) {
        return options
            .map(
              (option) => PopupMenuItem(
                value: option,
                child: Text(option, style: AppTextStyles.semiBold14),
              ),
            )
            .toList();
      },
      onSelected: (value) {
        // Handle menu item selection
        print('Selected: $value');
      },
    );
  }
}
