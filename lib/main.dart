import 'package:flutter/material.dart';
import 'package:flutter_getx/binding/register_binding.dart';
import 'package:flutter_getx/global/values/values.dart';
import 'package:flutter_getx/screens/screens.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Getx',
      theme: AppThemes.appTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: '/register',
      getPages: [
        GetPage(
          name: '/register',
          page: () => RegisterScreen(),
          binding: RegisterBinding(),
        ),
        GetPage(
          name: '/login',
          page: () => LoginScreen(),
        ),
      ],
    );
  }
}
