import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthFirebaseController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  RxBool isLoading = false.obs;

  Future<void> registerWithEmailAndPassword(
    String email,
    String password,
    String username,
  ) async {
    try {
      isLoading.value = true;
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Store additional user data in Firestore
      User? user = _auth.currentUser;
      if (user != null) {
        await _firestore.collection('users').doc(user.uid).set({
          'email': email,
          'username': username,
        });
      }
    } catch (e) {
      // Handle registration errors
      print('Registration failed: $e');
      rethrow; // Rethrow the exception to propagate it further
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> loginWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      isLoading.value = true;
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      // Handle login errors
      print('Login failed: $e');
      rethrow; // Rethrow the exception to propagate it further
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> logout() async {
    try {
      await _auth.signOut();
    } catch (e) {
      // Handle logout errors
      print('Logout failed: $e');
    }
  }

  // Add a method to get the user's username
  Future<String?> getUsername(String userId) async {
    try {
      DocumentSnapshot userDoc =
          await _firestore.collection('users').doc(userId).get();
      if (userDoc.exists) {
        return userDoc['username'];
      } else {
        return null;
      }
    } catch (e) {
      print('Error getting username: $e');
      return null;
    }
  }
}
