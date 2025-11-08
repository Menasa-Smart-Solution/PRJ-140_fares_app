import 'package:equatable/equatable.dart';
import 'package:fares/core/services/internet_service.dart';
import 'package:fares/core/utils/exports.dart';
import 'package:fares/features/store/home/data/models/create_ticket_request_model.dart';
import 'package:fares/features/store/home/data/models/tickets_response_models.dart';
import 'package:fares/features/store/home/data/repo/home_store_repo.dart';

part 'tickets_state.dart';

class TicketsCubit extends Cubit<TicketsState> {
  final HomeStoreRepo _repo;
  final InternetService _internetService;
  TicketsCubit(this._repo, this._internetService) : super(const TicketsState());

  Future<void> createTicket(CreateTicketRequestModel body) async {
    emit(state.copyWith(createTicketState: StateType.loading));

    final result = await _repo.createTickets(body: body);
    result.fold(
      (failure) {
        emit(
          state.copyWith(
            createTicketState: StateType.error,
            errorMessage: failure.message,
          ),
        );
      },
      (_) {
        emit(state.copyWith(createTicketState: StateType.success));
      },
    );
  }

  Future<void> getTickets() async {
    emit(
      state.copyWith(getTicketsState: StateType.loading, errorMessage: null),
    );

    if (!await _internetService.isConnected()) {
      emit(state.copyWith(getTicketsState: StateType.noInternet));
      return;
    }

    final result = await _repo.getTickets();
    result.fold(
      (failure) {
        emit(
          state.copyWith(
            getTicketsState: StateType.error,
            errorMessage: failure.message,
          ),
        );
      },
      (ticketsResponse) {
        emit(
          state.copyWith(
            getTicketsState: StateType.success,
            tickets: ticketsResponse.tickets,
          ),
        );
      },
    );
  }
}
