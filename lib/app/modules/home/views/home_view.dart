import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_getx/app/modules/home/controllers/auth_controller.dart';
import 'package:first_getx/app/modules/login/views/login_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final AuthController authC = Get.find<AuthController>();
  HomeView({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Text('SIGN IN ANONYMOUSLY'),

            //STATUS
            Obx(() {
              return Text(
                  'Status: ${authC.user.value != null ? 'Signed in as ${authC.user.value!.uid}' : 'Signed Out'}');
            })
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        controller.increment();
      }),
    );
  }
}
