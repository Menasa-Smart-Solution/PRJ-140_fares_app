part of 'receipts_cubit.dart';

class ReceiptsState extends Equatable {
  final StateType getAllReceiptsState;
  final List<ReceiptModel> receipts;
  final String? errorMessage;
  final int currentPage;
  final bool hasMoreData;
  final bool isLoadingMore;
  final StateType receiptDetailsState;
  final ReceiptModel? receiptDetails;

  const ReceiptsState({
    this.getAllReceiptsState = StateType.initial,
    this.receipts = const [],
    this.errorMessage,
    this.currentPage = 1,
    this.hasMoreData = true,
    this.isLoadingMore = false,
    this.receiptDetailsState = StateType.loading,
    this.receiptDetails,
  });

  ReceiptsState copyWith({
    StateType? getAllReceiptsState,
    List<ReceiptModel>? receipts,
    String? errorMessage,
    int? currentPage,
    bool? hasMoreData,
    bool? isLoadingMore,
    StateType? receiptDetailsState,
    ReceiptModel? receiptDetails,
  }) {
    return ReceiptsState(
      getAllReceiptsState: getAllReceiptsState ?? this.getAllReceiptsState,
      receipts: receipts ?? this.receipts,
      errorMessage: errorMessage ?? this.errorMessage,
      currentPage: currentPage ?? this.currentPage,
      hasMoreData: hasMoreData ?? this.hasMoreData,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      receiptDetailsState: receiptDetailsState ?? this.receiptDetailsState,
      receiptDetails: receiptDetails ?? this.receiptDetails,
    );
  }

  @override
  List<Object?> get props => [
    getAllReceiptsState,
    receipts,
    errorMessage,
    currentPage,
    hasMoreData,
    isLoadingMore,
    receiptDetailsState,
    receiptDetails,
  ];
}
