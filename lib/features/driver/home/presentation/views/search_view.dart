part of '../widgets/widgets.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<OrdersCubit>(),
      child: Scaffold(
        body: SafeArea(
          child: const SearchViewBody().withPadding(
            horizontal: 16,
            vertical: 20,
          ),
        ),
      ),
    );
  }
}
