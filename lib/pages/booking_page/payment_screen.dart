import 'dart:developer';

import 'package:credit_card_form/credit_card_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:smart_car_parking/service/db_service.dart';

import '../../controller/PakingController.dart';

class PaymentScreen extends StatelessWidget {
  final String name;
  final int time;
  final String vehicleNumber;
  final String slot;
  final int payment;
  const PaymentScreen({
    super.key,
    required this.name,
    required this.time,
    required this.vehicleNumber,
    required this.slot,
    required this.payment,
  });

  @override
  Widget build(BuildContext context) {
    ParkingController parkingController = Get.put(ParkingController());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: 100,
          left: 20,
          right: 20,
          bottom: 80,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Enter Payment Details",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 200,
              width: MediaQuery.of(context).size.width,
              child: CreditCardForm(
                theme: CreditCardLightTheme(),
                onChanged: (CreditCardResult result) {
                  print(result.cardNumber);
                  print(result.cardHolderName);
                  print(result.expirationMonth);
                  print(result.expirationYear);
                  print(result.cardType);
                  print(result.cvc);
                },
              ),
            ),
            // Spacer(),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () async {
                try {
                  await DbService().bookParkingSlot(
                      name, vehicleNumber, time, slot, payment);
                  Navigator.of(context).pop();
                  parkingController.bookParkingSlot(slot);
                } catch (e) {
                  log(e.toString());
                }
              },
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.blueGrey[900],
                    borderRadius: BorderRadius.circular(12)),
                child: Center(
                  child: Text(
                    "Proceed to Pay",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
