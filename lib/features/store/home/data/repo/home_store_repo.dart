import 'package:dartz/dartz.dart';
import 'package:fares/core/errors/exceptions.dart';
import 'package:fares/core/errors/failure.dart';
import 'package:fares/features/store/home/data/datasource/store_home_datasource.dart';
import 'package:fares/features/store/home/data/models/create_ticket_request_model.dart';
import 'package:fares/features/store/home/data/models/tickets_response_models.dart';

class HomeStoreRepo {
  final StoreHomeDataSource _dataSource;
  HomeStoreRepo(this._dataSource);

  Future<Either<Failure, void>> createTickets({
    required CreateTicketRequestModel body,
  }) async {
    try {
      await _dataSource.createTickets(body: body);
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  Future<Either<Failure, TicketsResponseModels>> getTickets() async {
    try {
      final response = await _dataSource.getTickets();
      return Right(response);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }
}
