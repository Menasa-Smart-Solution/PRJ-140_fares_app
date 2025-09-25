part of '../../../feature_imports.dart';

class OrderQrCodeViewBody extends StatelessWidget {
  const OrderQrCodeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: AppTextFormField(
            hintText: 'QR Code',
            validator: (value) {},
            backgroundColor: Colors.transparent,
          ),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              AppTextButton(onPressed: () {}, text: LocaleKeys.confirm.tr()),
              verticalSpace(24),
              AppTextButton(
                onPressed: () {},
                backgroundColor: AppColors.primaryColor.withAlpha(50),
                textColor: AppColors.primaryColor,
                text: LocaleKeys.scanQRCode.tr(),
              ),
              verticalSpace(32),
            ],
          ),
        ),
      ],
    );
  }
}
