import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guardly/parent_navigation_menu.dart';
import 'package:guardly/features/screens/AccountType/widgets/child/Scan&ReferCode/grantp.dart';

class ConnectionController extends GetxController {
  final _db = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  var generatedOTP = "------".obs;
  var isLoading = false.obs;
  var connectionStatus = 'pending'.obs; // Connection track karne ke liye

  @override
  void onInit() {
    super.onInit();
    // Screen load hote hi OTP generate karein
    createNewOTPAndListen();
  }

  Future<void> createNewOTPAndListen() async {
    try {
      // Check karein ke user login hai ya nahi
      if (_auth.currentUser == null) {
        Get.snackbar("Auth Error", "Please login first to generate OTP");
        return;
      }

      isLoading.value = true;

      // 1. 6-digit random number generate karein
      String newCode = (Random().nextInt(900000) + 100000).toString();
      String pId = _auth.currentUser!.uid;

      // 2. Firebase mein save karein
      await _db.collection('pairing_codes').doc(newCode).set({
        'parentId': pId,
        'status': 'pending',
        'createdAt': FieldValue.serverTimestamp(),
      });

      generatedOTP.value = newCode;
      isLoading.value = false;

      // 3. Listener: Jaise hi child verify kare, Parent Dashboard pe chala jaye
      _db.collection('pairing_codes').doc(newCode).snapshots().listen((snap) {
        if (snap.exists) {
          connectionStatus.value = snap.data()?['status'] ?? 'pending';
          if (connectionStatus.value == 'verified') {
            Get.offAll(() => const ParentNavigationMenu());
          }
        }
      });
    } catch (e) {
      isLoading.value = false;
      debugPrint("Firebase Error: $e");
      Get.snackbar(
        "Error",
        "OTP generate nahi ho saka. Internet check karein.",
      );
    }
  }

  // --- CHILD SIDE VERIFICATION ---
  // Controller ke andar verifyOTP function ko update karein
  Future<void> verifyOTP(String code) async {
    try {
      isLoading.value = true;
      var doc = await _db.collection('pairing_codes').doc(code).get();

      if (doc.exists && doc.data()?['status'] == 'pending') {
        String pId = doc.data()?['parentId'];
        String cId = _auth.currentUser?.uid ?? "no_id";

        // 1. Link child to parent (Using .set with merge: true)
        // Is se agar document nahi bhi hai toh naya ban jayega, crash nahi hoga
        await _db.collection('users').doc(cId).set({
          'linkedParentId': pId,
          'isLinked': true,
          'role': 'child',
          'lastConnected': FieldValue.serverTimestamp(),
        }, SetOptions(merge: true));

        // 2. Update pairing status
        await _db.collection('pairing_codes').doc(code).update({
          'status': 'verified',
          'childId': cId,
        });

        connectionStatus.value = 'verified';
        Get.snackbar("Success", "Devices linked successfully!");

        // Seedha Permissions screen par jayein
        Get.to(() => const GrantPermission());
      } else {
        Get.snackbar("Invalid Code", "Code purana hai ya ghalat hai.");
      }
    } catch (e) {
      debugPrint("DATABASE ERROR: $e");
      Get.snackbar(
        "Connection Error",
        "Device link nahi ho saki: Internet ya Database ka masla hai.",
      );
    } finally {
      isLoading.value = false;
    }
  }
}
