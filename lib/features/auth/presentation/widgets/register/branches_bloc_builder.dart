import 'package:fares/core/utils/exports.dart';
import 'package:fares/features/auth/data/models/branches_response_model.dart';
import 'package:fares/features/auth/presentation/cubit/auth/auth_cubit.dart';
import 'package:fares/features/auth/presentation/cubit/auth/auth_state.dart';
import 'package:flutter/material.dart';

class BranchesBlocBuilder extends StatelessWidget {
  const BranchesBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state.getBranchesState.isSuccess) {
          return DropdownButtonFormField<BranchModel>(
            hint: Text(LocaleKeys.branch.tr()),
            initialValue: state.selectedBranch,
            items: state.branches
                .map(
                  (branch) =>
                      DropdownMenuItem(value: branch, child: Text(branch.name)),
                )
                .toList(),
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.textFormFieldBg,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 15,
              ),
              border: _buildBorder(),
              enabledBorder: _buildBorder(),
              focusedBorder: _buildBorder(color: AppColors.primaryColor),
            ),

            validator: (value) {
              if (value == null) {
                return LocaleKeys.fieldRequired.tr();
              }
              return null;
            },
            onChanged: (value) {
              context.read<AuthCubit>().selectBranch(value);
            },
          );
        } else {
          return AppTextFormField(
            hintText: LocaleKeys.selectStatus.tr(),
            backgroundColor: AppColors.white,
            suffixIcon: const Icon(Icons.arrow_drop_down),
            validator: (value) {},
          );
        }
      },
    );
  }

  OutlineInputBorder _buildBorder({Color? color}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(50),
      borderSide: const BorderSide(
        color: AppColors.textFormBorderColor,
        width: 1.5,
      ),
    );
  }
}
