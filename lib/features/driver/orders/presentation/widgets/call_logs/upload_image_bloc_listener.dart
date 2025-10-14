part of '../../../feature_imports.dart';

class UploadImageBlocListener extends StatelessWidget {
  const UploadImageBlocListener({super.key, required this.parcelId});
  final int parcelId;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CallRecordsCubit, CallRecordsState>(
      listener: (context, state) {
        if (state.uploadImageState.isLoading) {
          OverlayHelper.showLoadingOverlay(context);
        } else if (state.uploadImageState.isSuccess) {
          OverlayHelper.hideLoadingOverlay();
          context.read<CallRecordsCubit>().getCallImages(parcelId: parcelId);
          showSnackBar(message: 'تم رفع الصورة بنجاح', type: SnackType.success);
        } else if (state.uploadImageState.isError) {
          OverlayHelper.hideLoadingOverlay();
          showSnackBar(message: state.errorMessage!, type: SnackType.error);
        } else if (state.uploadImageState.isNoInternet) {
          OverlayHelper.hideLoadingOverlay();
          showSnackBar(
            message: 'لا يوجد اتصال بالانترنت',
            type: SnackType.warning,
          );
        } else if (state.pickImageState.isSuccess) {
          // Ask for confirmation before uploading the picked image
          final file = state.image;
          if (file == null) return;
          final cubit = context.read<CallRecordsCubit>();
          showDialog<bool>(
            context: context,
            barrierDismissible: false,
            builder: (context) => BlocProvider.value(
              value: cubit,
              child: AlertDialog(
                title: const Text('تأكيد'),
                content: const Text('هل أنت متأكد أنك تريد رفع هذه الصورة؟'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: const Text(
                      'إلغاء',
                      style: TextStyle(color: AppColors.red),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                    child: const Text(
                      'تأكيد',
                      style: TextStyle(color: AppColors.primaryColor),
                    ),
                  ),
                ],
              ),
            ),
          ).then((confirmed) {
            if (confirmed == true) {
              // trigger upload
              cubit.uploadCallImage(parcelId: parcelId, image: file);
            }
          });
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
