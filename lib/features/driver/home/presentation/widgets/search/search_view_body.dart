part of '../widgets.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({super.key});

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  Timer? _debounce;
  final TextEditingController _searchController = TextEditingController();

  void _onSearchChanged(String? query) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 300), () {
      if (query == null || query.isEmpty) {
        context.read<OrdersCubit>().getOrders(isRefresh: true, isSearch: true);
      } else {
        context.read<OrdersCubit>().getOrders(
          id: query,
          isRefresh: true,
          isSearch: true,
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
        SearchBlocBuilder(searchController: _searchController),
      ],
    );
  }
}
