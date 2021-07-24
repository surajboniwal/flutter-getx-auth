import 'package:flutter/material.dart';
import 'package:flutter_getx/controller/auth_controller.dart';
import 'package:flutter_getx/global/values/values.dart';
import 'package:flutter_getx/screens/auth/widgets/widgets.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: Get.height * 0.33 + 56,
                  child: ClipPath(
                    clipper: RegisterClipper(),
                    child: Container(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).padding.top),
                      width: double.maxFinite,
                      color: AppColors.TEAL_COLOR,
                      child: Center(
                        child: GetBuilder<AuthController>(
                          builder: (controller) => Text(
                            controller.welcomeMessage!,
                            style: TextStyle(
                              fontSize: 22.0,
                              color: AppColors.WHITE_COLOR,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 360.0,
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Register to continue.',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: AppColors.BLUE_COLOR,
                          ),
                        ),
                        SizedBox(height: 12.0),
                        InputFieldBorder(
                          hint: 'Full name',
                          controller: _fullNameController,
                        ),
                        SizedBox(height: 12.0),
                        InputFieldBorder(
                          hint: 'Email',
                          controller: _emailController,
                        ),
                        SizedBox(height: 12.0),
                        InputFieldBorder(
                          hint: 'Password',
                          controller: _passwordController,
                          isPassword: true,
                        ),
                        SizedBox(height: 12.0),
                        AuthButton(
                          onPressed: () {
                            Get.find<AuthController>().register(
                              _fullNameController.text,
                              _emailController.text,
                              _passwordController.text,
                            );
                          },
                          label: 'Register',
                        ),
                        OrSeperator(),
                        AuthButton(
                          onPressed: () {
                            Get.toNamed('/login');
                          },
                          isBordered: true,
                          label: 'Login',
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(),
              ],
            ),
          ),
          GetBuilder<AuthController>(
            init: Get.find<AuthController>(),
            builder: (controller) => controller.loading
                ? Container(
                    color: AppColors.TEAL_COLOR,
                    child: Center(
                      child: CircularProgressIndicator(
                        color: AppColors.WHITE_COLOR,
                      ),
                    ),
                  )
                : SizedBox(),
          )
        ],
      ),
    );
  }
}
