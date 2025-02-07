import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:intellicloud/data/models/use_model.dart';

class UserProfileService {
  // Future<void> createUserProfile(UserProfile userProfile) async {
  //   return await _usersCollection.doc(userProfile.uid).set(userProfile.toMap());
  // }

  // Future<void> updateUserProfile(UserProfile userProfile) async {
  //   return await _usersCollection
  //       .doc(userProfile.uid)
  //       .update(userProfile.toMap());
  // }

  Future<UserProfile?> getUserProfile() async {
    DocumentSnapshot doc = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    if (doc.exists) {
      return UserProfile.fromMap(doc.data() as Map<String, dynamic>);
    }

    return null;
  }

  Future<UserProfile?> resetUserPassword(doc) async {
    return UserProfile.fromMap(doc as Map<String, dynamic>);
  }

  Future<UserProfile?> updateUserProfile(doc) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update(doc);

    return UserProfile.fromMap(doc as Map<String, dynamic>);
  }
  /*Future<UserProfile?> getUserProfile(String uid) async {
    DocumentSnapshot doc = await _usersCollection.doc(uid).get();
    if (doc.exists) {
      return UserProfile.fromMap(doc.data() as Map<String, dynamic>);
    }
    return null;
  } */
}
