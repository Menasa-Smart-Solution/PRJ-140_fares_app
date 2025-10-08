part of '../../../feature_imports.dart';

class AllOrdersViewBody extends StatelessWidget {
  const AllOrdersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SearchOrderTextFormField(),
        verticalSpace(16),
        const OrdersBlocBuilder(),
      ],
    );
  }
}
