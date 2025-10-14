# 📚 Pagination Implementation Guide

## Overview
This guide shows how to implement pagination in the Orders feature using the `ParcelsResponseModel` structure.

---

## 📊 Pagination Data Structure

Your `ParcelsResponseModel` provides the following pagination data:

```dart
ParcelsDataModel {
  currentPage: 1,           // Current page number
  lastPage: 5,              // Total number of pages
  perPage: 10,              // Items per page
  total: 50,                // Total items count
  from: 1,                  // Starting item number
  to: 10,                   // Ending item number
  
  nextPageUrl: "...?page=2", // URL for next page (null if last)
  prevPageUrl: null,         // URL for previous page (null if first)
  firstPageUrl: "...?page=1",
  lastPageUrl: "...?page=5",
  
  data: [...],              // List of ParcelModel items
  links: [...]              // Pagination links for UI
}
```

---

## 🔧 State Management

### OrdersState Properties

```dart
class OrdersState {
  final StateType ordersState;          // loading, success, error
  final ParcelsResponseModel? orders;   // Full API response
  final String? errorMessage;           // Error message if any
  
  // Pagination-specific properties:
  final List<ParcelModel> allParcels;   // Accumulated list (for infinite scroll)
  final int currentPage;                // Current page number
  final bool hasMorePages;              // True if more pages available
  final bool isLoadingMore;             // True when loading next page
}
```

---

## 🎯 Cubit Methods

### 1. `getOrders()` - Initial Load
```dart
// Loads the first page
// Use isRefresh=true to reset pagination state
await cubit.getOrders(
  status: 'pending',    // Optional filter
  id: '123',            // Optional filter
  isRefresh: true,      // Reset pagination
);
```

### 2. `loadMoreOrders()` - Load Next Page
```dart
// Automatically loads next page and appends to list
// Checks hasMorePages and isLoadingMore before loading
await cubit.loadMoreOrders(
  status: 'pending',
  id: '123',
);
```

### 3. `goToPage()` - Jump to Specific Page
```dart
// Loads specific page (replaces current list)
await cubit.goToPage(
  page: 3,
  status: 'pending',
  id: '123',
);
```

---

## 🎨 UI Implementation Patterns

### Pattern 1: Infinite Scroll (Recommended)

**Best for:** Long lists, mobile-first apps

```dart
class OrdersListView extends StatefulWidget {
  @override
  State<OrdersListView> createState() => _OrdersListViewState();
}

class _OrdersListViewState extends State<OrdersListView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    // Load more when 90% scrolled
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
    return BlocBuilder<OrdersCubit, OrdersState>(
      builder: (context, state) {
        return RefreshIndicator(
          onRefresh: () => context.read<OrdersCubit>().getOrders(isRefresh: true),
          child: ListView.builder(
            controller: _scrollController,
            itemCount: state.allParcels.length + (state.hasMorePages ? 1 : 0),
            itemBuilder: (context, index) {
              if (index == state.allParcels.length) {
                return const CircularProgressIndicator(); // Loading indicator
              }
              return OrderCardItem(parcel: state.allParcels[index]);
            },
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
```

**Features:**
- ✅ Automatic loading when scrolling near bottom
- ✅ Pull-to-refresh support
- ✅ Smooth user experience
- ✅ Mobile-friendly

---

### Pattern 2: Load More Button

**Best for:** Controlled loading, better performance

```dart
class OrdersWithLoadMoreButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrdersCubit, OrdersState>(
      builder: (context, state) {
        return Column(
          children: [
            // Orders list
            Expanded(
              child: ListView.builder(
                itemCount: state.allParcels.length,
                itemBuilder: (context, index) {
                  return OrderCardItem(parcel: state.allParcels[index]);
                },
              ),
            ),
            
            // Load more button
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
              
            // End message
            if (!state.hasMorePages && state.allParcels.isNotEmpty)
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text('لا توجد طلبات أخرى'),
              ),
          ],
        );
      },
    );
  }
}
```

**Features:**
- ✅ User controls when to load more
- ✅ Better performance (no scroll listener)
- ✅ Clear end-of-list indication
- ✅ Simple implementation

---

### Pattern 3: Page Numbers with Buttons

**Best for:** Data tables, desktop apps, precise navigation

```dart
class OrdersWithPageButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrdersCubit, OrdersState>(
      builder: (context, state) {
        final paginationData = state.orders?.data?.parcels;
        final currentPage = paginationData?.currentPage ?? 1;
        final lastPage = paginationData?.lastPage ?? 1;

        return Column(
          children: [
            // Orders list
            Expanded(
              child: ListView.builder(
                itemCount: state.allParcels.length,
                itemBuilder: (context, index) {
                  return OrderCardItem(parcel: state.allParcels[index]);
                },
              ),
            ),
            
            // Pagination controls
            Container(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Previous button
                  IconButton(
                    onPressed: currentPage > 1
                        ? () => context.read<OrdersCubit>().goToPage(
                              page: currentPage - 1,
                            )
                        : null,
                    icon: const Icon(Icons.arrow_back),
                  ),
                  
                  const SizedBox(width: 16),
                  
                  // Page info
                  Text('صفحة $currentPage من $lastPage'),
                  
                  const SizedBox(width: 16),
                  
                  // Next button
                  IconButton(
                    onPressed: state.hasMorePages
                        ? () => context.read<OrdersCubit>().goToPage(
                              page: currentPage + 1,
                            )
                        : null,
                    icon: const Icon(Icons.arrow_forward),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
```

**Features:**
- ✅ Jump to specific page
- ✅ Clear pagination status
- ✅ Previous/Next navigation
- ✅ Good for desktop layouts

---

### Pattern 4: CustomScrollView with Slivers (Advanced)

**Best for:** Complex layouts, mixing different widget types

```dart
class OrdersSliverView extends StatefulWidget {
  @override
  State<OrdersSliverView> createState() => _OrdersSliverViewState();
}

class _OrdersSliverViewState extends State<OrdersSliverView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
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
    return BlocBuilder<OrdersCubit, OrdersState>(
      builder: (context, state) {
        return RefreshIndicator(
          onRefresh: () => context.read<OrdersCubit>().getOrders(isRefresh: true),
          child: CustomScrollView(
            controller: _scrollController,
            slivers: [
              // App Bar
              const SliverAppBar(
                title: Text('الطلبات'),
                floating: true,
              ),
              
              // Header statistics
              SliverToBoxAdapter(
                child: OrderStatisticsWidget(
                  totalOrders: state.orders?.data?.parcelsCount,
                  totalPrice: state.orders?.data?.parcelsPrice,
                ),
              ),
              
              // Orders list
              SliverList.builder(
                itemCount: state.allParcels.length,
                itemBuilder: (context, index) {
                  return OrderCardItem(parcel: state.allParcels[index]);
                },
              ),
              
              // Loading indicator
              if (state.isLoadingMore)
                const SliverToBoxAdapter(
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: CircularProgressIndicator(),
                    ),
                  ),
                ),
              
              // End message
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
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
```

**Features:**
- ✅ Flexible layout with different widget types
- ✅ Collapsible app bar
- ✅ Mix lists with other content
- ✅ Advanced scroll behavior

---

## 🔍 Pagination Info Display

### Show Pagination Statistics

```dart
Widget buildPaginationInfo(OrdersState state) {
  final paginationData = state.orders?.data?.parcels;
  
  return Container(
    padding: const EdgeInsets.all(16),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Items range
        Text(
          'عرض ${paginationData?.from ?? 0} - ${paginationData?.to ?? 0} '
          'من ${paginationData?.total ?? 0}',
        ),
        
        // Page number
        Text(
          'صفحة ${paginationData?.currentPage ?? 1} / '
          '${paginationData?.lastPage ?? 1}',
        ),
      ],
    ),
  );
}
```

---

## 🎛️ Filter with Pagination

### Apply Filters and Reset Pagination

```dart
class OrdersFilterWidget extends StatelessWidget {
  final String? selectedStatus;
  
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: selectedStatus,
      items: [
        DropdownMenuItem(value: null, child: Text('الكل')),
        DropdownMenuItem(value: 'pending', child: Text('قيد الانتظار')),
        DropdownMenuItem(value: 'delivered', child: Text('مسلم')),
        DropdownMenuItem(value: 'canceled', child: Text('ملغي')),
      ],
      onChanged: (newStatus) {
        // Reset pagination when filter changes
        context.read<OrdersCubit>().getOrders(
          status: newStatus,
          isRefresh: true, // Important: Reset pagination
        );
      },
    );
  }
}
```

---

## ⚡ Performance Tips

1. **Use `const` constructors** where possible to avoid rebuilds
2. **Implement `ListView.builder`** instead of `ListView` for better performance
3. **Add scroll threshold** (90%) to load more before reaching the end
4. **Cache images** in list items to prevent reloading
5. **Use `RepaintBoundary`** around complex list items
6. **Implement item keys** for better list diffing

```dart
ListView.builder(
  itemBuilder: (context, index) {
    return RepaintBoundary(
      key: ValueKey(state.allParcels[index].id),
      child: OrderCardItem(parcel: state.allParcels[index]),
    );
  },
)
```

---

## 🐛 Common Issues & Solutions

### Issue 1: Duplicate Items After Refresh
**Solution:** Always use `isRefresh: true` to reset the list
```dart
await cubit.getOrders(isRefresh: true);
```

### Issue 2: Multiple Load More Calls
**Solution:** Check `isLoadingMore` before calling
```dart
if (!state.isLoadingMore && state.hasMorePages) {
  cubit.loadMoreOrders();
}
```

### Issue 3: Scroll Position Jumps
**Solution:** Use `ScrollController` with `keepScrollOffset: true`
```dart
final _scrollController = ScrollController(keepScrollOffset: true);
```

### Issue 4: Empty State Not Showing
**Solution:** Check for empty list with successful state
```dart
if (state.ordersState == StateType.success && state.allParcels.isEmpty) {
  return EmptyStateWidget();
}
```

---

## 📱 Complete Example

See `pagination_examples.dart` for 4 complete working examples:
1. ✅ Infinite Scroll
2. ✅ Load More Button
3. ✅ Page Numbers
4. ✅ Sliver Layout

---

## 🎓 Key Concepts

- **`allParcels`**: Accumulated list of all loaded items (for infinite scroll)
- **`currentPage`**: Tracks which page you're on
- **`hasMorePages`**: Checks if `currentPage < lastPage`
- **`isLoadingMore`**: Prevents duplicate API calls while loading
- **`isRefresh`**: Resets pagination state to page 1

---

## 🚀 Quick Start

1. Use `getOrders()` to load first page
2. Add scroll listener to detect when user reaches bottom
3. Call `loadMoreOrders()` when `hasMorePages` is true
4. Display `isLoadingMore` indicator at list end
5. Use `RefreshIndicator` with `isRefresh: true` for pull-to-refresh

That's it! Your pagination is ready! 🎉
