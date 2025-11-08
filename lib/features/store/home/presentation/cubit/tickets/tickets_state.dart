part of 'tickets_cubit.dart';

class TicketsState extends Equatable {
  final StateType createTicketState;
  final StateType getTicketsState;
  final String? errorMessage;
  final List<TicketsModel> tickets;
  final bool isComplaints;

  @override
  List<Object?> get props => [
    createTicketState,
    getTicketsState,
    errorMessage,
    tickets,
    isComplaints,
  ];

  const TicketsState({
    this.createTicketState = StateType.initial,
    this.getTicketsState = StateType.initial,
    this.errorMessage,
    this.isComplaints = false,
    this.tickets = const [],
  });

  TicketsState copyWith({
    StateType? createTicketState,
    StateType? getTicketsState,
    String? errorMessage,
    List<TicketsModel>? tickets,
    bool? isComplaints,
  }) {
    return TicketsState(
      createTicketState: createTicketState ?? this.createTicketState,
      getTicketsState: getTicketsState ?? this.getTicketsState,
      errorMessage: errorMessage ?? this.errorMessage,
      tickets: tickets ?? this.tickets,
      isComplaints: isComplaints ?? this.isComplaints,
    );
  }
}
