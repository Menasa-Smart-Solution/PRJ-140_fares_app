part of 'tickets_cubit.dart';

class TicketsState extends Equatable {
  final StateType createTicketState;
  final StateType getTicketsState;
  final String? errorMessage;
  final List<TicketsModel> tickets;

  @override
  List<Object?> get props => [
    createTicketState,
    getTicketsState,
    errorMessage,
    tickets,
  ];

  const TicketsState({
    this.createTicketState = StateType.initial,
    this.getTicketsState = StateType.initial,
    this.errorMessage,
    this.tickets = const [],
  });

  TicketsState copyWith({
    StateType? createTicketState,
    StateType? getTicketsState,
    String? errorMessage,
    List<TicketsModel>? tickets,
  }) {
    return TicketsState(
      createTicketState: createTicketState ?? this.createTicketState,
      getTicketsState: getTicketsState ?? this.getTicketsState,
      errorMessage: errorMessage ?? this.errorMessage,
      tickets: tickets ?? this.tickets,
    );
  }
}
