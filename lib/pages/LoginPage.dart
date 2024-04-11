import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:smart_car_parking/components/MyButton.dart';
import 'package:smart_car_parking/components/MyTextField.dart';
import 'package:smart_car_parking/pages/MapPage.dart';
import 'package:smart_car_parking/pages/homepage/homepage.dart';
import 'package:smart_car_parking/service/login_service.dart';

import 'booking_page/booking_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController demo = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple.shade200,
        title: Text(" L O G I N 🌳"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(children: [
              Row(
                children: [
                  Text(
                    "Welcome back ❤️",
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "LOGIN",
                    style: TextStyle(fontSize: 45, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              SizedBox(height: 30),
              MyTextField(
                  icons: Icons.email, lable: "Email id", Onchange: demo),
              SizedBox(height: 10),
              MyTextField(
                  icons: Icons.password, lable: "Password", Onchange: demo),
              SizedBox(height: 90),
              GestureDetector(
                onTap: () async {
                  final user = await signInWithGoogle();
                  if (user != null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Sign in was successful')));
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => MapPage(),
                      ),
                    );
                  }
                },
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.deepPurple),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Continue with Google',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              MyButton(
                icon: Icons.admin_panel_settings_rounded,
                Btname: "LOGIN",
                ontap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => BookingPage(
                            slotId: '1',
                            slotName: 'Slot 1',
                          )));
                },
              ),
              // SizedBox(height: 20),
              // MyButton(
              //   icon: Icons.person_add,
              //   Btname: "SIGN UP",
              //   ontap: () {},
              // ),
            ]),
          ),
        ),
      ),
    );
  }
}
