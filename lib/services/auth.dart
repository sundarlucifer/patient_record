import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class AuthService {

  Firestore _db = Firestore.instance;

  AuthService() {
    //TODO: Get doctor profile if auth present
  }

  Future<void> uploadRecord(Map<String, dynamic> record) {
    var date = DateTime.now();
    String day = '${date.day}:${date.month}:${date.year}';
    String token = date.toIso8601String();
    return _db.collection("records").document("Dr.Sundar").collection(day).document(token).setData(record, merge: true);
  }

}

final AuthService authService = new AuthService();
