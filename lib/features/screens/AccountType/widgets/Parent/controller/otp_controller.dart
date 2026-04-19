import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class OTPController extends GetxController {
  var generatedOTP = "......".obs; // Shuru mein dots dikhayain gay
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    createNewOTP(); // Screen khulne par khud hi generate ho jaye
  }

  Future<void> createNewOTP() async {
    try {
      isLoading.value = true;
      
      // 1. 6-digit random number generate karein
      String newCode = (Random().nextInt(900000) + 100000).toString();
      
      // 2. Firebase mein save karein
      // Note: "pairing_codes" naam ki collection khud ban jayegi
      await FirebaseFirestore.instance.collection('pairing_codes').doc(newCode).set({
        'parentId': FirebaseAuth.instance.currentUser?.uid ?? "unknown_parent",
        'createdAt': FieldValue.serverTimestamp(),
        'status': 'pending',
      });

      generatedOTP.value = newCode;
    } catch (e) {
      Get.snackbar("Error", "OTP generate nahi ho saka");
    } finally {
      isLoading.value = false;
    }
  }
}