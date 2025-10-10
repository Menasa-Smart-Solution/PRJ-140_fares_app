part of '../../../feature_imports.dart';

class CallLogsViewBody extends StatelessWidget {
  const CallLogsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(slivers: [CallLogsBlocBuilder()]);
  }
}
