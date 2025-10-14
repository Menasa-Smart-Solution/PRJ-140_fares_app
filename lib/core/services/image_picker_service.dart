import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fares/core/routing/app_router.dart';
import 'package:fares/core/theme/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../generated/locale_keys.g.dart';

enum ImageSourceType { gallery, camera }

class ImagePickerService {
  final ImagePicker _picker = ImagePicker();

  Future<File?> pickImage({required ImageSourceType type}) async {
    final Permission permission = await _getPermission(type);

    final bool hasPermission = await _handlePermission(permission);

    if (hasPermission) {
      final XFile? pickedFile = await _picker.pickImage(
        source: type == ImageSourceType.camera
            ? ImageSource.camera
            : ImageSource.gallery,
      );
      if (pickedFile != null) {
        return File(pickedFile.path);
      }
    }
    return null;
  }

  Future<Permission> _getPermission(ImageSourceType type) async {
    if (type == ImageSourceType.camera) {
      return Permission.camera;
    } else {
      if (Platform.isIOS) {
        return Permission.photos;
      } else {
        final androidInfo = await DeviceInfoPlugin().androidInfo;
        if (androidInfo.version.sdkInt >= 33) {
          return Permission.photos; // Android 13+
        }
        return Permission.storage;
      }
    }
  }

  Future<bool> _handlePermission(Permission permission) async {
    final status = await permission.status;
    if (status.isGranted || status.isLimited) {
      return true;
    }

    final newStatus = await permission.request();
    if (newStatus.isGranted || newStatus.isLimited) {
      return true;
    }

    if (newStatus.isPermanentlyDenied || newStatus.isRestricted) {
      _showPlatformSpecificSettingsDialog(permission);
    }

    return false;
  }

  void _showPlatformSpecificSettingsDialog(Permission permission) {
    String permissionName = permission == Permission.camera
        ? LocaleKeys.camera.tr()
        : LocaleKeys.gallery.tr();
    String dialogTitle = LocaleKeys.accessPermissionRequired.tr();
    String dialogContent = tr(
      LocaleKeys.cameraPremissionDesc.tr(),
      namedArgs: {"name": permissionName},
    );

    if (Platform.isIOS) {
      showCupertinoDialog(
        context: AppRouter.navigatorKey.currentContext!,
        builder: (context) => CupertinoAlertDialog(
          title: Text(dialogTitle),
          content: Text(dialogContent),
          actions: <Widget>[
            CupertinoDialogAction(
              child: Text(
                LocaleKeys.cancel.tr(),
                style: const TextStyle(color: Colors.red),
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
            CupertinoDialogAction(
              isDefaultAction: true,
              child: Text(
                LocaleKeys.openSettings.tr(),
                style: const TextStyle(color: AppColors.primaryColor),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                openAppSettings();
              },
            ),
          ],
        ),
      );
    } else {
      // For Android
      showDialog(
        context: AppRouter.navigatorKey.currentContext!,
        builder: (context) => AlertDialog(
          title: Text(dialogTitle),
          content: Text(dialogContent),
          actions: <Widget>[
            TextButton(
              child: Text(
                LocaleKeys.cancel.tr(),
                style: const TextStyle(color: Colors.red),
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: Text(
                LocaleKeys.openSettings.tr(),
                style: const TextStyle(color: AppColors.primaryColor),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                openAppSettings();
              },
            ),
          ],
        ),
      );
    }
  }
}
