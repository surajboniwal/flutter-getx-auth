import 'package:flutter/material.dart';
import 'package:flutter_getx/controller/auth_controller.dart';
import 'package:flutter_getx/global/values/values.dart';
import 'package:flutter_getx/screens/auth/widgets/widgets.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.TEAL_COLOR,
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                flex: 1,
                child: ClipPath(
                  clipper: RegisterClipper(),
                  child: Container(
                    padding: EdgeInsets.only(bottom: 56.0),
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
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 360.0,
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Form(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Login to continue.',
                              style: TextStyle(
                                fontSize: 18.0,
                                color: AppColors.BLUE_COLOR,
                              ),
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
                                Get.find<AuthController>().login(
                                    _emailController.text,
                                    _passwordController.text);
                              },
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
            ],
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
