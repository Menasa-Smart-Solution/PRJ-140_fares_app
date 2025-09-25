part of '../widgets.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  context.pop();
                },
                icon: const Icon(Icons.arrow_back, color: AppColors.grey),
              ),

              Expanded(
                child: AppTextFormField(
                  hintText: LocaleKeys.searchHint.tr(),
                  radius: 10,
                  showFocusedBorder: false,
                  borderColor: AppColors.textFormFieldBg,
                  validator: (value) {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
