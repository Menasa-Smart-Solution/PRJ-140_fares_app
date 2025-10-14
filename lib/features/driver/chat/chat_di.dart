import 'package:fares/core/di/dependency_injection.dart';
import 'package:fares/features/driver/chat/data/datasources/chat_data_source.dart';
import 'package:fares/features/driver/chat/data/datasources/chat_data_source_impl.dart';
import 'package:fares/features/driver/chat/data/repositories/chat_repo.dart';
import 'package:fares/features/driver/chat/presentation/cubit/chat_cubit.dart';

Future<void> initChatDI() async {
  // Register ChatDataSource as lazy singleton
  getIt.registerLazySingleton<ChatDataSource>(
    () => ChatDataSourceImpl(apiService: getIt()),
  );

  // Register ChatRepo as lazy singleton
  getIt.registerLazySingleton(() => ChatRepo(chatDataSource: getIt()));

  // Register ChatCubit as factory (new instance per request)
  getIt.registerFactory(() => ChatCubit(getIt(), getIt()));
}
