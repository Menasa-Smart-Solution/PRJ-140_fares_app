part of '../../../feature_imports.dart';

class CitiesPricesViewBody extends StatelessWidget {
  const CitiesPricesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await context.read<CitiesPriceCubit>().getCitiesPrices();
      },
      child: CustomScrollView(
        slivers: [
          const CitiesPricesSearch(),

          SliverToBoxAdapter(child: verticalSpace(20)),
          const CitiesPricesBlocBuilder(),
        ],
      ),
    );
  }
}

class CitiesPricesSearch extends StatefulWidget {
  const CitiesPricesSearch({super.key});

  @override
  State<CitiesPricesSearch> createState() => _CitiesPricesSearchState();
}

class _CitiesPricesSearchState extends State<CitiesPricesSearch> {
  Timer? _debounce;
  void _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      context.read<CitiesPriceCubit>().searchCities(query);
    });
  }

  @override
  dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: AppTextFormField(
        hintText: 'ابحث عن مدينه هنا',
        validator: (value) {},
        onChanged: _onSearchChanged,
      ),
    );
  }
}
