part of 'navigation_cubit.dart';

class DriverMainState extends Equatable {
  final int currentIndex;

  const DriverMainState({this.currentIndex = 0});

  DriverMainState copyWith({int? currentIndex}) {
    return DriverMainState(currentIndex: currentIndex ?? this.currentIndex);
  }

  @override
  List<Object?> get props => [currentIndex];
}
