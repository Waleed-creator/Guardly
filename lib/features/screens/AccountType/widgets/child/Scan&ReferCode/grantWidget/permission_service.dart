import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PermissionService {
  static final _firestore = FirebaseFirestore.instance;
  static final _auth = FirebaseAuth.instance;

  // Child ki permissions Firebase mein save karo
  static Future<void> savePermissions({
    required bool camera,
    required bool microphone,
    required bool location,
    required bool storage,
    required bool notifications,
    required bool contacts,
    required bool accessibility,
  }) async {
    final uid = _auth.currentUser?.uid;
    if (uid == null) return;

    await _firestore
        .collection('users')
        .doc(uid)
        .collection('permissions')
        .doc('device_permissions')
        .set({
          'camera': camera,
          'microphone': microphone,
          'location': location,
          'storage': storage,
          'notifications': notifications,
          'contacts': contacts,
          'accessibility': accessibility,
          'updatedAt': FieldValue.serverTimestamp(),
          'childId': uid,
        });
  }

  // Parent ke liye — child ki permissions fetch karo
  static Stream<DocumentSnapshot> getChildPermissions(String childId) {
    return _firestore
        .collection('users')
        .doc(childId)
        .collection('permissions')
        .doc('device_permissions')
        .snapshots();
  }
}
