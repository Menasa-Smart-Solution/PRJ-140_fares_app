enum StateType { initial, loading, success, error, empty, noInternet }

extension StateTypeExtension on StateType {
  bool get isInitial => this == StateType.initial;
  bool get isLoading => this == StateType.loading;
  bool get isSuccess => this == StateType.success;
  bool get isError => this == StateType.error;
  bool get isEmpty => this == StateType.empty;
  bool get isNoInternet => this == StateType.noInternet;
}
