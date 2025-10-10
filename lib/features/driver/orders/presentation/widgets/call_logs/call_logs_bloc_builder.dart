part of '../../../feature_imports.dart';

class CallLogsBlocBuilder extends StatelessWidget {
  const CallLogsBlocBuilder({super.key, required this.parcelId});

  final int parcelId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CallRecordsCubit, CallRecordsState>(
      builder: (context, state) {
        switch (state.callRecordsState) {
          case StateType.loading:
            return const CallImagesLoadingShimmer();
          case StateType.success:
            return CallLogsImagesListView(images: state.callImages ?? []);
          case StateType.error:
            return SliverFillRemaining(
              hasScrollBody: false,
              child: CustomEmptyWidget(
                message: state.errorMessage ?? LocaleKeys.unknown.tr(),
                imagePath: AppImages.imagesEmpty,
              ),
            );
          case StateType.empty:
            return SliverFillRemaining(
              hasScrollBody: false,
              child: CustomEmptyWidget(
                imagePath: AppImages.imagesEmpty,
                message: LocaleKeys.noImagesUploaded.tr(),
              ),
            );
          case StateType.noInternet:
            return SliverFillRemaining(
              hasScrollBody: false,
              child: InternetConnectionWidget(
                onPressed: () {
                  context.read<CallRecordsCubit>().getCallImages(
                    parcelId: parcelId,
                  );
                },
              ),
            );
          default:
            return const SliverToBoxAdapter(child: SizedBox());
        }
      },
    );
  }
}

class CallImagesLoadingShimmer extends StatelessWidget {
  const CallImagesLoadingShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      child: Skeletonizer(
        enabled: true,
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 1,
          ),
          itemCount: 10,
          itemBuilder: (context, index) => Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: const BorderRadius.all(Radius.circular(16)),
            ),
          ),
        ),
      ),
    );
  }
}
