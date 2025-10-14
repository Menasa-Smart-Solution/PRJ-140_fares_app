part of '../../../feature_imports.dart';

class CallLogsViewBody extends StatelessWidget {
  const CallLogsViewBody({super.key, required this.parcelId});

  final int parcelId;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await Future.wait([
          context.read<CallRecordsCubit>().getCallImages(parcelId: parcelId),
        ]);
      },
      child: CustomScrollView(
        slivers: [
          CallLogsBlocBuilder(parcelId: parcelId),
          SliverToBoxAdapter(
            child: UploadImageBlocListener(parcelId: parcelId),
          ),
        ],
      ),
    );
  }
}
