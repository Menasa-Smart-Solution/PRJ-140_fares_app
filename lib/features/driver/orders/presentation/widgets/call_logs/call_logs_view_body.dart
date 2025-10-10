part of '../../../feature_imports.dart';

class CallLogsViewBody extends StatelessWidget {
  const CallLogsViewBody({super.key, required this.parcelId});

  final int parcelId;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [CallLogsBlocBuilder(parcelId: parcelId)]);
  }
}
