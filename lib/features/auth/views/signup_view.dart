import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:huungry/features/auth/views/login_view.dart';
import 'package:huungry/features/auth/widgets/custom_btn.dart';
import '../../../core/constants/app_colors.dart';
import '../../../shared/custom_text.dart';
import '../../../shared/custom_txtfield.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passController = TextEditingController();
    TextEditingController confirmPassController = TextEditingController();
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Form(
          key: formKey,
          child: Column(
            children: [
              Gap(200),
              SvgPicture.asset('assets/logo/logo.svg' , color: AppColors.primary),
              CustomText(text: 'Welcome to our Food App' , color: AppColors.primary),
              Gap(100),
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
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Gap(30),
                        CustomTxtfield(
                          controller: nameController,
                          hint: 'Name',
                          isPassword: false,
                        ),
                        Gap(15),
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
                        /// Sign up
                        CustomAuthBtn(
                          color: AppColors.primary,
                          textColor: Colors.white,
                          text: 'Sign up',
                          onTap: () {
                            if(formKey.currentState!.validate()) {
                              print('success register');
                            }
                          },
                        ),
                        Gap(15),
                        /// go to login
                        CustomAuthBtn(
                          textColor: AppColors.primary,
                          color: Colors.white,
                          text: 'Go To Login ?',
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (c) {
                              return LoginView();
                            }));
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),




            ],
          ),
        ),
      ),
    );
  }
}
