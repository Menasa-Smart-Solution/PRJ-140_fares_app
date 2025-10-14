part of '../../../feature_imports.dart';

class SearchOrderTextFormField extends StatefulWidget {
  const SearchOrderTextFormField({super.key});

  @override
  State<SearchOrderTextFormField> createState() =>
      _SearchOrderTextFormFieldState();
}

class _SearchOrderTextFormFieldState extends State<SearchOrderTextFormField> {
  final TextEditingController _searchController = TextEditingController();
  @override
  void dispose() {
    _searchController.dispose();
    _debounce?.cancel();
    _searchController.removeListener(() {
      _onSearchChanged(_searchController.text);
    });
    super.dispose();
  }

  Timer? _debounce;
  // Search function with debounce
  void _onSearchChanged(String? query) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 300), () {
      // Call API with search query or null to get all orders
      if (query == null || query.isEmpty) {
        // When search is cleared, fetch all orders
        context.read<OrdersCubit>().getOrders(isRefresh: true);
      } else {
        // When searching, call API with the ID parameter
        context.read<OrdersCubit>().getOrders(id: query, isRefresh: true);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      _onSearchChanged(_searchController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      hintText: LocaleKeys.searchHint.tr(),
      borderColor: AppColors.textFormBorderColor,
      backgroundColor: AppColors.white,
      validator: (value) {},
      onChanged: (value) {
        _onSearchChanged(value);
      },
      prefixIcon: Image.asset(
        AppImages.imagesSearchPng,
        width: 20,
        height: 20,
      ).withPadding(all: 12),
    );
  }
}
