import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:huungry/core/constants/app_colors.dart';
import 'package:huungry/features/auth/views/signup_view.dart';
import 'package:huungry/root.dart';
import 'package:huungry/shared/custom_text.dart';
import 'package:huungry/shared/custom_txtfield.dart';

import '../widgets/custom_btn.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passController = TextEditingController();
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                  Gap(200),
                  SvgPicture.asset('assets/logo/logo.svg' ,color: AppColors.primary),
                  Gap(10),
                  CustomText(
                    text: 'Welcome Back, Discover The Fast Food',
                    color: AppColors.primary,
                    size: 13,
                    weight: FontWeight.w500,
                ),
                  Gap(60),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30),
                          topLeft: Radius.circular(30),
                        ),
                      ),
                      child: Column(
                        children: [
                          Gap(30),
                          CustomTxtfield(
                            controller: emailController,
                            hint: 'Email Address',
                            isPassword: false,
                          ),
                          Gap(15),
                          CustomTxtfield(
                            controller: passController,
                            hint: 'Password',
                            isPassword: true,
                          ),
                          Gap(20),
                          CustomAuthBtn(
                            color: AppColors.primary,
                            textColor: Colors.white,
                            text: 'Login',
                            onTap: () {
                              if(formKey.currentState!.validate()) {
                                print('success login');
                              }
                            },
                          ),
                          Gap(15),
                          /// go to Signup
                          CustomAuthBtn(
                            textColor: AppColors.primary,
                            color: Colors.white,
                            text: 'Create Account ?',
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (c) {
                                return SignupView();
                              }));
                            },
                          ),
                          /// Guest
                          Gap(20),
                          GestureDetector(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (c) {
                                  return Root();
                                }));
                              },
                              child: CustomText(
                                text: 'Continue as a guest ?',
                                size: 13,
                                color: Colors.white,
                                weight: FontWeight.bold,
                              ),
                          ),
                     ],
                      ),
                    ),
                  ),
                ],
            ),
          ),
        ),


      ),
    );
  }
}
