part of '../../../features_imports.dart';

class StoreHomeSearchBody extends StatefulWidget {
  const StoreHomeSearchBody({super.key});

  @override
  State<StoreHomeSearchBody> createState() => _StoreHomeSearchBodyState();
}

class _StoreHomeSearchBodyState extends State<StoreHomeSearchBody> {
  Timer? _debounce;
  final TextEditingController _searchController = TextEditingController();

  void _onSearchChanged(String? query) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      if (query == null || query.isEmpty) {
        context.read<StoreParcelsCubit>().getStoreParcels(
          refresh: true,
          id: null,
          fromSearch: true,
        );
      } else {
        context.read<StoreParcelsCubit>().getStoreParcels(
          id: query,
          refresh: true,
          fromSearch: true,
        );
      }
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            IconButton(
              onPressed: () {
                context.pop();
              },
              icon: const Icon(Icons.arrow_back, color: AppColors.grey),
            ),

            Expanded(
              child: AppTextFormField(
                hintText: LocaleKeys.searchHint.tr(),
                radius: 10,
                controller: _searchController,
                showFocusedBorder: false,
                borderColor: AppColors.textFormFieldBg,
                onChanged: (value) {
                  _onSearchChanged(value);
                },
                validator: (value) {},
              ),
            ),
          ],
        ),
        verticalSpace(16),
        const Expanded(child: StoreParcelsBlocBuilder(fromSearch: true)),
      ],
    );
  }
}
