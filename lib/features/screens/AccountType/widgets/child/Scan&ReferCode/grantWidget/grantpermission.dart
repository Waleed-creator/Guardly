import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:guardly/Utilities/constants/colors.dart';
import 'package:guardly/Utilities/constants/images.dart';
import 'package:guardly/Utilities/constants/texts.dart';
import 'package:guardly/common/widgets/button/u_elevated_button.dart';
import 'package:guardly/features/screens/personalization/profile.dart';
import 'permission_service.dart';

class PermissionHandler extends StatefulWidget {
  const PermissionHandler({super.key});

  @override
  State<PermissionHandler> createState() => _PermissionHandlerState();
}

class _PermissionHandlerState extends State<PermissionHandler> {
  bool isCameraEnabled = false;
  bool isMicrophoneEnabled = false;
  bool isLocationEnabled = false;
  bool isStorageEnabled = false;
  bool isNotificationsEnabled = false;
  bool isContactsEnabled = false;
  bool isAccessibilityEnabled = false;
  bool _isSaving = false;

  // Normal permissions ke liye
  Future<void> _requestPermission(
    Permission permission,
    bool val,
    Function(bool) updateState,
  ) async {
    if (val) {
      final status = await permission.request();
      updateState(status.isGranted);
    } else {
      updateState(false);
    }
  }

  // Storage — Android version check karke request karo
  Future<void> _requestStoragePermission(
      bool val, Function(bool) updateState) async {
    if (!val) {
      updateState(false);
      return;
    }

    if (Platform.isAndroid) {
      final androidInfo = await DeviceInfoPlugin().androidInfo;
      final sdkInt = androidInfo.version.sdkInt;

      if (sdkInt >= 33) {
        // Android 13+ — media permissions
        final images = await Permission.photos.request();
        final video = await Permission.videos.request();
        final audio = await Permission.audio.request();
        updateState(images.isGranted || video.isGranted || audio.isGranted);
      } else {
        // Android 12 aur neeche
        final status = await Permission.storage.request();
        updateState(status.isGranted);
      }
    }
  }

  // Firebase mein save karo aur agle screen pe jao
  Future<void> _saveAndContinue() async {
    setState(() => _isSaving = true);

    try {
      await PermissionService.savePermissions(
        camera: isCameraEnabled,
        microphone: isMicrophoneEnabled,
        location: isLocationEnabled,
        storage: isStorageEnabled,
        notifications: isNotificationsEnabled,
        contacts: isContactsEnabled,
        accessibility: isAccessibilityEnabled,
      );

      Get.to(() => ProfileBodySection());
    } catch (e) {
      Get.snackbar(
        'Error',
        'Permissions save nahi ho sakin. Dobara try karein.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.shade100,
      );
    } finally {
      setState(() => _isSaving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        permissionItem(
          icon: Icons.camera_alt,
          title: UTexts.cameraTitle,
          subtitle: UTexts.cameraSubtitle,
          value: isCameraEnabled,
          onChanged: (val) => _requestPermission(
            Permission.camera,
            val,
            (granted) => setState(() => isCameraEnabled = granted),
          ),
        ),
        permissionItem(
          icon: Icons.mic,
          title: UTexts.microphoneTitle,
          subtitle: UTexts.microphoneSubtitle,
          value: isMicrophoneEnabled,
          onChanged: (val) => _requestPermission(
            Permission.microphone,
            val,
            (granted) => setState(() => isMicrophoneEnabled = granted),
          ),
        ),
        permissionItem(
          icon: Icons.location_on,
          title: UTexts.locationTitle,
          subtitle: UTexts.locationSubtitle,
          value: isLocationEnabled,
          onChanged: (val) => _requestPermission(
            Permission.locationWhenInUse,
            val,
            (granted) => setState(() => isLocationEnabled = granted),
          ),
        ),
        permissionItem(
          icon: Icons.storage_rounded,
          title: UTexts.storageTitle,
          subtitle: UTexts.storageSubtitle,
          value: isStorageEnabled,
          onChanged: (val) => _requestStoragePermission(
            val,
            (granted) => setState(() => isStorageEnabled = granted),
          ),
        ),
        permissionItem(
          icon: Icons.notification_add_rounded,
          title: UTexts.notifyTitle,
          subtitle: UTexts.notifySubtitle,
          value: isNotificationsEnabled,
          onChanged: (val) => _requestPermission(
            Permission.notification,
            val,
            (granted) => setState(() => isNotificationsEnabled = granted),
          ),
        ),
        permissionItem(
          icon: Icons.contacts_sharp,
          title: UTexts.contactTitle,
          subtitle: UTexts.contactSubtitle,
          value: isContactsEnabled,
          onChanged: (val) => _requestPermission(
            Permission.contacts,
            val,
            (granted) => setState(() => isContactsEnabled = granted),
          ),
        ),

        const SizedBox(height: 10),

        Center(
          child: SizedBox(
            height: 160,
            width: 320,
            child: Image.asset(UImages.privacyProtected, fit: BoxFit.contain),
          ),
        ),

        const SizedBox(height: 10),

        _isSaving
            ? const CircularProgressIndicator()
            : UElevatedButton.rectangle(
                text: UTexts.continueButton,
                onPressed: _saveAndContinue,
                backgroundColor: UColors.bprimary,
                elevation: 2,
                horizontalMargin: 10,
              ),
      ],
    );
  }

  Widget permissionItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required bool value,
    required Function(bool) onChanged,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      margin: const EdgeInsets.only(top: 5),
      decoration: BoxDecoration(
        color: UColors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Icon(icon, color: UColors.iconPrimary),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(color: UColors.subtextSecondary),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Switch(
                  value: value,
                  onChanged: onChanged,
                  activeThumbColor: Colors.white,
                  activeTrackColor: UColors.bprimary,
                  inactiveThumbColor: UColors.white,
                  inactiveTrackColor: UColors.haifwhite,
                  trackOutlineColor:
                      WidgetStateProperty.all(Colors.transparent),
                  trackOutlineWidth: WidgetStateProperty.all(0),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}