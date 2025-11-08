part of '../../../feature_imports.dart';

class StoreParcelsListView extends StatefulWidget {
  const StoreParcelsListView({
    super.key,
    required this.storeParcels,
    required this.isLoadingMore,
    this.status,
  });
  final List<StoreParcelModel> storeParcels;
  final bool isLoadingMore;
  final String? status;

  @override
  State<StoreParcelsListView> createState() => _StoreParcelsListViewState();
}

class _StoreParcelsListViewState extends State<StoreParcelsListView> {
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener); // remove listener first
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      if (!widget.isLoadingMore && widget.storeParcels.isNotEmpty) {
        context.read<StoreParcelsCubit>().getStoreParcels(
          status: widget.status,
          isLoadMore: true,
        );
      } else if (!widget.isLoadingMore && widget.storeParcels.isEmpty) {
        // initial load on scroll end if needed
        context.read<StoreParcelsCubit>().getStoreParcels(
          status: widget.status,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await context.read<StoreParcelsCubit>().getStoreParcels(
          status: widget.status,
          refresh: true,
        );
      },
      child: ListView.separated(
        controller: _scrollController,
        physics: const AlwaysScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          // show loading as last item when paginating
          if (index == widget.storeParcels.length && widget.isLoadingMore) {
            return const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Center(child: CustomLoading()),
            );
          }
          return StoreParcelsItem(storeParcelModel: widget.storeParcels[index]);
        },
        separatorBuilder: (context, index) => verticalSpace(8),
        itemCount: widget.storeParcels.length + (widget.isLoadingMore ? 1 : 0),
      ),
    );
  }
}
