import 'package:fares/core/utils/exports.dart';

class MainStoreCubit extends Cubit<int> {
  MainStoreCubit() : super(0);

  void changeTab(int index) {
    emit(index);
  }

  int get currentIndex => state;
}
