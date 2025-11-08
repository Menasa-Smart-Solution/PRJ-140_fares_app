import 'package:fares/features/store/home/data/models/create_ticket_request_model.dart';
import 'package:fares/features/store/home/data/models/store_home_response_model.dart';
import 'package:fares/features/store/home/data/models/tickets_response_models.dart';

abstract class StoreHomeDataSource {
  Future<void> createTickets({required CreateTicketRequestModel body});
  Future<TicketsResponseModels> getTickets({bool isComplaints = false});
  Future<StoreHomeResponseModel> getStoreHome();
  Future<void> logout();
}
