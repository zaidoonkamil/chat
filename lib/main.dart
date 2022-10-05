import 'package:chats/app/controllers/auth_controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/routes/app_pages.dart';
import 'app/utils/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final authC = Get.put(AuthController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(const Duration(seconds: 4)),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Obx(
                () => GetMaterialApp(
              debugShowCheckedModeBanner: false,
              title: "ChatApp",
              theme: ThemeData(
                brightness: Brightness.light,
                primaryColor: Colors.white,
                accentColor: Colors.black,
                buttonColor: const Color(0xFFF03738),
              ),
              initialRoute: authC.isSkipIntro.isTrue
                  ? authC.isAuth.isTrue
                  ? Routes.HOME
                  : Routes.LOGIN
                  : Routes.INTRODUCTION,
              getPages: AppPages.routes,
            ),
          );
        }
        return FutureBuilder(
          future: authC.firstInitialized(),
          builder: (context, snapshot) => const SplashScreen(),
        );
      },
    );
  }
}
