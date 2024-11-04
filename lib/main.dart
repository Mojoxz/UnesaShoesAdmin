import 'package:flutter/material.dart';
import 'package:sepatu_admin/controller/home_controller.dart';
import 'package:sepatu_admin/firebase_option.dart';
import 'package:sepatu_admin/pages/home_page.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: firebaseOptions);
  //register Controller
  Get.put(HomeController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Unesa Shoes Admin',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

