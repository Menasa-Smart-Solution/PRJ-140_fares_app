part of '../widgets/widgets.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeCubit>()..getAllSummary(),
      child: Stack(
        children: [
          SafeArea(
            child: const HomeViewBody().withPadding(bottom: 20, horizontal: 16),
          ),
          const LogoutBlocListener(),
          const FlightsBlocListener(),
        ],
      ),
    );
  }
}
