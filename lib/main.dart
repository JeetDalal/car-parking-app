import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_car_parking/controller/splace_controller.dart';
import 'package:smart_car_parking/pages/splace_page/splace_screen.dart';
import 'config/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: 'AIzaSyAo9FE8PqebxF0R3--7eiWXsXZLun3PUa4',
      appId: '1:973553058687:ios:f62c69ee83aa803a7bd04a',
      messagingSenderId: '973553058687',
      projectId: 'smart-car-parking-dab06',
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SplaceController splaceController = Get.put(SplaceController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Car Parking',
      getPages: pages,
      theme: ThemeData(useMaterial3: true),
      home: const Splace_Screen(),
    );
  }
}
