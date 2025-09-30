import 'package:fares/core/common_ui/widgets/full_screen_loading.dart';
import 'package:flutter/material.dart';

class OverlayHelper {
  static OverlayEntry? _overlayEntry;

  static void showLoadingOverlay(BuildContext context) {
    if (_overlayEntry != null) return; // Prevent multiple overlays

    _overlayEntry = OverlayEntry(
      builder: (context) => const FullScreenLoading(),
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  static void hideLoadingOverlay() {
    if (_overlayEntry != null) {
      _overlayEntry!.remove();
      _overlayEntry = null;
    }
  }
}
