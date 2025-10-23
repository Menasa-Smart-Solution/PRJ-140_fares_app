part of '../../../feature_imports.dart';

class CollectionSettlementsViewBody extends StatefulWidget {
  const CollectionSettlementsViewBody({super.key});

  @override
  State<CollectionSettlementsViewBody> createState() =>
      _CollectionSettlementsViewBodyState();
}

class _CollectionSettlementsViewBodyState
    extends State<CollectionSettlementsViewBody> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(onListen);
  }

  void onListen() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      context.read<ReceiptsCubit>().getReceipts(isLoadMore: true);
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _scrollController.removeListener(onListen);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _scrollController,
      slivers: const [ReceiptsBlocBuilder()],
    ).withPadding(vertical: 20, horizontal: 16);
  }
}
