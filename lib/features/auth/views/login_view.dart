import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:huungry/core/constants/app_colors.dart';
import 'package:huungry/core/network/api_error.dart';
import 'package:huungry/features/auth/data/auth_repo.dart';
import 'package:huungry/features/auth/views/signup_view.dart';
import 'package:huungry/root.dart';
import 'package:huungry/shared/custom_button.dart';
import 'package:huungry/shared/custom_snack.dart';
import 'package:huungry/shared/custom_text.dart';
import 'package:huungry/shared/custom_txtfield.dart';
import 'package:huungry/shared/glass_container.dart';
import '../widgets/custom_btn.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  bool isLoading = false;
  AuthRepo authRepo = AuthRepo();
  Future<void> login() async {
    if(formKey.currentState!.validate()) {
      setState(() => isLoading = true);
      try {
        final user = await authRepo.login(emailController.text.trim(), passController.text.trim());
        if(user != null) {
          Navigator.push(context, MaterialPageRoute(builder: (c) => Root()));
        }
        setState(() => isLoading = false);
      } catch (e) {
        setState(() => isLoading = false);
        String errorMsg = 'unhandled error in login';
        if(e is ApiError) {
          errorMsg = e.message;
        }
        ScaffoldMessenger.of(context).showSnackBar(customSnack(errorMsg));
      }
    }
  }

  @override
  void initState() {
    emailController.text = 'Sonic3@gmail.com';
    passController.text = '123456789';
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: glassContainer(
          child: Scaffold(
            extendBody: true,
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.transparent,
            body: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  child: Column(
                    children: [
                      Gap(100),
                      Banner(
                        color: Colors.green.shade700,
                        shadow: BoxShadow(color: Colors.black),
                        message: 'Rich Sonic',
                        location: BannerLocation.topStart,
                        child: SvgPicture.asset(
                          'assets/logo/logo.svg',
                          color: Colors.white70,
                        ),
                      ),
                      Gap(10),
                      CustomText(
                        text: 'Welcome Back, Discover The Fast Food',
                        color: Colors.white70,
                        size: 13,
                        weight: FontWeight.w500,
                      ),
                      Gap(60),
                      Column(
                        children: [
                          Gap(30),
                          CustomTxtfield(
                            controller: emailController,
                            hint: 'Email Address',
                            isPassword: false,
                          ),
                          Gap(8),
                          CustomTxtfield(
                            controller: passController,
                            hint: 'Password',
                            isPassword: true,
                          ),
                          Gap(20),
                          /// Login Button
                           CustomButton(
                            gap: 10,
                            widget: isLoading ? CupertinoActivityIndicator(color: AppColors.primary) : null,
                            height: 45,
                            text: 'Login',
                            onTap: login,
                            color: Colors.white.withOpacity(0.9),
                            textColor: AppColors.primary,
                          ),
                          Gap(20),
                          Row(
                            children: [
                              ///  Signup
                              Expanded(
                                child: CustomAuthBtn(
                                  textColor: Colors.white,
                                  text: 'Signup',
                                  onTap: () => Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (c) {
                                        return SignupView();
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              Gap(15),

                              /// Guest
                              Expanded(
                                child: CustomAuthBtn(
                                  isIcon: true,
                                  textColor: Colors.white,
                                  text: 'Guest',
                                  onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (c) {
                                        return Root();
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Gap(10),
                        ],
                      ),
                      Gap(250),
                      CustomText(text: '@RichSonic2025', color: Colors.white, size: 12, weight: FontWeight.bold),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
