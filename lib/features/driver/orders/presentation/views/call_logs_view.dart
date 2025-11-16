part of '../../feature_imports.dart';

class CallLogsView extends StatelessWidget {
  const CallLogsView({super.key, required this.id});
  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<CallRecordsCubit>()..getCallImages(parcelId: id),
      child: Scaffold(
        appBar: CustomAppBar(title: 'سجل لشحنة $id'),
        body: CallLogsViewBody(
          parcelId: id,
        ).withPadding(vertical: 20, horizontal: 16),
        floatingActionButton: Builder(
          builder: (context) {
            return FloatingActionButton.extended(
              onPressed: () async {
                await context.read<CallRecordsCubit>().pickImage();
              },
              icon: const Icon(Icons.add_a_photo),
              label: const Text('أضافة صورة سجل المكالمات'),
            );
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      ),
    );
  }
}
