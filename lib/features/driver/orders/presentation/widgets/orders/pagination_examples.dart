// ============================================
// PAGINATION EXAMPLES - Different Approaches
// ============================================

import 'package:fares/core/di/dependency_injection.dart';
import 'package:fares/core/enums/enums.dart';
import 'package:fares/features/driver/orders/presentation/cubit/orders/orders_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ============================================
// APPROACH 1: Infinite Scroll (Load More)
// ============================================
class InfiniteScrollOrdersExample extends StatefulWidget {
  const InfiniteScrollOrdersExample({super.key});

  @override
  State<InfiniteScrollOrdersExample> createState() =>
      _InfiniteScrollOrdersExampleState();
}

class _InfiniteScrollOrdersExampleState
    extends State<InfiniteScrollOrdersExample> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    // Check if user scrolled to bottom (90% threshold)
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent * 0.9) {
      final cubit = context.read<OrdersCubit>();
      // Trigger load more if has more pages and not already loading
      if (cubit.state.hasMorePages && !cubit.state.isLoadingMore) {
        cubit.loadMoreOrders();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<OrdersCubit>()..getOrders(),
      child: BlocBuilder<OrdersCubit, OrdersState>(
        builder: (context, state) {
          if (state.ordersState == StateType.loading &&
              state.allParcels.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.ordersState == StateType.error) {
            return Center(child: Text(state.errorMessage ?? 'خطأ'));
          }

          return RefreshIndicator(
            onRefresh: () async {
              await context.read<OrdersCubit>().getOrders(isRefresh: true);
            },
            child: ListView.builder(
              controller: _scrollController,
              itemCount: state.allParcels.length + (state.hasMorePages ? 1 : 0),
              itemBuilder: (context, index) {
                // Show loading indicator at the end
                if (index == state.allParcels.length) {
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: CircularProgressIndicator(),
                    ),
                  );
                }

                final parcel = state.allParcels[index];
                return ListTile(
                  title: Text(parcel.customerName ?? 'بدون اسم'),
                  subtitle: Text('الحالة: ${parcel.status}'),
                  trailing: Text('${parcel.productPrice} د.ل'),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

// ============================================
// APPROACH 2: Page Numbers with Buttons
// ============================================
class PageButtonsOrdersExample extends StatelessWidget {
  const PageButtonsOrdersExample({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<OrdersCubit>()..getOrders(),
      child: BlocBuilder<OrdersCubit, OrdersState>(
        builder: (context, state) {
          if (state.ordersState == StateType.loading) {
            return const Center(child: CircularProgressIndicator());
          }

          final paginationData = state.orders?.data?.parcels;
          final currentPage = paginationData?.currentPage ?? 1;
          final lastPage = paginationData?.lastPage ?? 1;

          return Column(
            children: [
              // Orders List
              Expanded(
                child: ListView.builder(
                  itemCount: state.allParcels.length,
                  itemBuilder: (context, index) {
                    final parcel = state.allParcels[index];
                    return ListTile(
                      title: Text(parcel.customerName ?? 'بدون اسم'),
                      subtitle: Text('الحالة: ${parcel.status}'),
                      trailing: Text('${parcel.productPrice} د.ل'),
                    );
                  },
                ),
              ),

              // Pagination Controls
              Container(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Previous Button
                    IconButton(
                      onPressed: currentPage > 1
                          ? () {
                              context.read<OrdersCubit>().goToPage(
                                page: currentPage - 1,
                              );
                            }
                          : null,
                      icon: const Icon(Icons.arrow_back),
                    ),

                    const SizedBox(width: 16),

                    // Page Info
                    Text(
                      'صفحة $currentPage من $lastPage',
                      style: const TextStyle(fontSize: 16),
                    ),

                    const SizedBox(width: 16),

                    // Next Button
                    IconButton(
                      onPressed: state.hasMorePages
                          ? () {
                              context.read<OrdersCubit>().goToPage(
                                page: currentPage + 1,
                              );
                            }
                          : null,
                      icon: const Icon(Icons.arrow_forward),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

// ============================================
// APPROACH 3: Load More Button
// ============================================
class LoadMoreButtonOrdersExample extends StatelessWidget {
  const LoadMoreButtonOrdersExample({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<OrdersCubit>()..getOrders(),
      child: BlocBuilder<OrdersCubit, OrdersState>(
        builder: (context, state) {
          if (state.ordersState == StateType.loading &&
              state.allParcels.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          return Column(
            children: [
              // Orders List
              Expanded(
                child: ListView.builder(
                  itemCount: state.allParcels.length,
                  itemBuilder: (context, index) {
                    final parcel = state.allParcels[index];
                    return ListTile(
                      title: Text(parcel.customerName ?? 'بدون اسم'),
                      subtitle: Text('الحالة: ${parcel.status}'),
                      trailing: Text('${parcel.productPrice} د.ل'),
                    );
                  },
                ),
              ),

              // Load More Button
              if (state.hasMorePages)
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: state.isLoadingMore
                      ? const CircularProgressIndicator()
                      : ElevatedButton(
                          onPressed: () {
                            context.read<OrdersCubit>().loadMoreOrders();
                          },
                          child: const Text('تحميل المزيد'),
                        ),
                ),

              // End of List Message
              if (!state.hasMorePages && state.allParcels.isNotEmpty)
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text('لا توجد طلبات أخرى'),
                ),
            ],
          );
        },
      ),
    );
  }
}

// ============================================
// APPROACH 4: CustomScrollView with Slivers
// ============================================
class SliverPaginationOrdersExample extends StatefulWidget {
  const SliverPaginationOrdersExample({super.key});

  @override
  State<SliverPaginationOrdersExample> createState() =>
      _SliverPaginationOrdersExampleState();
}

class _SliverPaginationOrdersExampleState
    extends State<SliverPaginationOrdersExample> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent * 0.9) {
      final cubit = context.read<OrdersCubit>();
      if (cubit.state.hasMorePages && !cubit.state.isLoadingMore) {
        cubit.loadMoreOrders();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<OrdersCubit>()..getOrders(),
      child: BlocBuilder<OrdersCubit, OrdersState>(
        builder: (context, state) {
          return RefreshIndicator(
            onRefresh: () async {
              await context.read<OrdersCubit>().getOrders(isRefresh: true);
            },
            child: CustomScrollView(
              controller: _scrollController,
              slivers: [
                // App Bar
                const SliverAppBar(title: Text('الطلبات'), floating: true),

                // Loading State
                if (state.ordersState == StateType.loading &&
                    state.allParcels.isEmpty)
                  const SliverFillRemaining(
                    child: Center(child: CircularProgressIndicator()),
                  ),

                // Orders List
                if (state.allParcels.isNotEmpty)
                  SliverList.builder(
                    itemCount: state.allParcels.length,
                    itemBuilder: (context, index) {
                      final parcel = state.allParcels[index];
                      return ListTile(
                        title: Text(parcel.customerName ?? 'بدون اسم'),
                        subtitle: Text('الحالة: ${parcel.status}'),
                        trailing: Text('${parcel.productPrice} د.ل'),
                      );
                    },
                  ),

                // Loading More Indicator
                if (state.isLoadingMore)
                  const SliverToBoxAdapter(
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  ),

                // End of List Message
                if (!state.hasMorePages && state.allParcels.isNotEmpty)
                  const SliverToBoxAdapter(
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text('لا توجد طلبات أخرى'),
                      ),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
