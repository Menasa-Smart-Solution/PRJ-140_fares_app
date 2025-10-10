part of 'parcels_cubit.dart';

sealed class ParcelsState extends Equatable {
  const ParcelsState();

  @override
  List<Object?> get props => [];
}

final class ParcelsInitial extends ParcelsState {}
