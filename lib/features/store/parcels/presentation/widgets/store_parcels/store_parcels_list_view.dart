part of '../../../feature_imports.dart';

class StoreParcelsListView extends StatefulWidget {
  const StoreParcelsListView({
    super.key,
    required this.storeParcels,
    required this.isLoadingMore,
  });
  final List<StoreParcelModel> storeParcels;
  final bool isLoadingMore;

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
    _scrollController.dispose();
    _scrollController.removeListener(_scrollListener);
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      if (!widget.isLoadingMore) {
        context.read<StoreParcelsCubit>().getStoreParcels(isLoadMore: true);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.separated(
            controller: _scrollController,
            itemBuilder: (context, index) =>
                StoreParcelsItem(storeParcelModel: widget.storeParcels[index]),
            separatorBuilder: (context, index) => verticalSpace(8),
            itemCount: widget.storeParcels.length,
          ),
        ),
        if (widget.isLoadingMore)
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: Center(child: CustomLoading()),
          ),
      ],
    );
  }
}
