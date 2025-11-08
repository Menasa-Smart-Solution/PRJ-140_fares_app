part of '../../../feature_imports.dart';

class StoreParcelsSearchField extends StatefulWidget {
  const StoreParcelsSearchField({super.key, this.status});
  final String? status;

  @override
  State<StoreParcelsSearchField> createState() =>
      _StoreParcelsSearchFieldState();
}

class _StoreParcelsSearchFieldState extends State<StoreParcelsSearchField> {
  final TextEditingController _searchController = TextEditingController();
  @override
  void dispose() {
    _searchController.dispose();
    _debounce?.cancel();
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
        context.read<StoreParcelsCubit>().getStoreParcels(refresh: true);
      } else {
        // When searching, call API with the ID parameter
        context.read<StoreParcelsCubit>().getStoreParcels(
          id: query,
          status: widget.status,
          refresh: true,
        );
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
