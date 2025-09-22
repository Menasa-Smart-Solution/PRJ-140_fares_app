import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:fares/core/helpers/extensions.dart';
import 'package:fares/core/theme/app_colors.dart';
import 'package:fares/core/theme/app_text_styles.dart';
import 'package:fares/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';

class OtpResendCode extends StatefulWidget {
  const OtpResendCode({super.key, required this.email});
  final String email;
  @override
  State<OtpResendCode> createState() => _OtpResendCodeState();
}

class _OtpResendCodeState extends State<OtpResendCode> {
  int _secondsRemaining = 59;
  Timer? _timer;
  bool _isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  _startTimer() {
    setState(() {
      _isButtonEnabled = false;
      _secondsRemaining = 59;
    });

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining > 0) {
        setState(() {
          _secondsRemaining--;
        });
      } else {
        setState(() {
          _isButtonEnabled = true;
        });
        _timer?.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(LocaleKeys.dontReceiveCode.tr(), style: AppTextStyles.med16),

        _isButtonEnabled == false
            ? Text(
                _isButtonEnabled
                    ? LocaleKeys.resendCode.tr()
                    : LocaleKeys.resendIn.tr(
                        namedArgs: {'seconds': _secondsRemaining.toString()},
                      ),
                style: AppTextStyles.med16.copyWith(
                  color: AppColors.primaryColor,
                ),
              )
            : Text(
                LocaleKeys.resendCode.tr(),
                style: AppTextStyles.med16.copyWith(
                  color: AppColors.primaryColor,
                ),
              ).onTap(
                function: () {
                  if (_isButtonEnabled) {
                    _startTimer();
                  }
                },
              ),
      ],
    );
  }
}
