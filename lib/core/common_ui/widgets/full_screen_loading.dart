import 'package:fares/core/common_ui/widgets/custom_loading.dart';
import 'package:flutter/material.dart';

class FullScreenLoading extends StatelessWidget {
  const FullScreenLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white.withAlpha(150),
      child: const Center(child: CustomLoading()),
    );
  }
}
