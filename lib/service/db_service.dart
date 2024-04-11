import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DbService {
  Future<void> bookParkingSlot(String name, String vehicleNumber, int time,
      String slot, int payment) async {
    try {
      await FirebaseFirestore.instance.collection('bookings').add({
        "userId": FirebaseAuth.instance.currentUser!.uid,
        "time": time,
        "slot": slot,
        "vehicleNumber": vehicleNumber,
        "name": name,
        "payment": payment
      }).then((value) => log("Data inserted successfully"));
    } catch (e) {
      log(e.toString());
    }
  }
}
