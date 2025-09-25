part of '../../../feature_imports.dart';

class SendMessageFormField extends StatelessWidget {
  const SendMessageFormField({super.key, required this.bottomPadding});

  final double bottomPadding;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        bottom: bottomPadding,
        top: 10,
      ),
      alignment: Alignment.bottomCenter,
      decoration: const BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.grey500,
            blurRadius: 10,
            offset: Offset(0, -2),
          ),
        ],
      ),

      child: Row(
        children: [
          Expanded(
            child: AppTextFormField(
              hintText: LocaleKeys.writeYourMessage.tr(),
              validator: (value) {},
              borderColor: AppColors.textFormFieldBg,
              showFocusedBorder: false,
            ),
          ),
          horizontalSpace(10),

          Material(
            color: Colors.transparent,
            child: Ink(
              decoration: const ShapeDecoration(
                color: AppColors.primaryColor,
                shape: CircleBorder(),
              ),
              child: InkWell(
                onTap: () {},
                customBorder: const CircleBorder(),

                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: Center(
                    child: SvgPicture.asset(
                      AppImages.imagesSend,
                      width: 20,
                      height: 20,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
