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
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController(text: 'Sonic3@gmail.com');
  final passController = TextEditingController(text: '123456789');
  bool isLoading = false;
  final authRepo = AuthRepo();

  Future<void> login() async {
    if (!formKey.currentState!.validate()) return;
    setState(() => isLoading = true);

    try {
      final user = await authRepo.login(
        emailController.text.trim(),
        passController.text.trim(),
      );
      if (user != null) Navigator.push(context, MaterialPageRoute(builder: (_) =>  Root()));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        customSnack(e is ApiError ? e.message : 'Unhandled login error'),
      );
    } finally {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: glassContainer(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Form(
            key: formKey,
            child: Column(
              children: [
                const Gap(140),
                Banner(
                  color: Colors.green.shade700,
                  message: 'Rich Sonic',
                  location: BannerLocation.topStart,
                  child: SvgPicture.asset('assets/logo/logo.svg', color: Colors.white70),
                ),
                const Gap(10),
                const CustomText(
                  text: 'Welcome Back, Discover The Fast Food',
                  color: Colors.white70,
                  size: 13,
                  weight: FontWeight.w500,
                ),
                const Gap(50),
                Column(
                  children: [
                    CustomTxtfield(
                      controller: emailController,
                      hint: 'Email Address',
                      isPassword: false,
                    ),
                    const Gap(10),
                    CustomTxtfield(
                      controller: passController,
                      hint: 'Password',
                      isPassword: true,
                    ),
                    const Gap(20),
                    CustomButton(
                      height: 45,
                      gap: 10,
                      text: 'Login',
                      color: Colors.white.withOpacity(0.9),
                      textColor: AppColors.primary,
                      widget: isLoading
                          ? CupertinoActivityIndicator(color: AppColors.primary)
                          : null,
                      onTap: login,
                    ),
                    const Gap(20),
                    Row(
                      children: [
                        Expanded(
                          child: CustomAuthBtn(
                            text: 'Signup',
                            textColor: Colors.white,
                            onTap: () => Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (_) => const SignupView()),
                            ),
                          ),
                        ),
                        const Gap(15),
                        Expanded(
                          child: CustomAuthBtn(
                            text: 'Guest',
                            isIcon: true,
                            textColor: Colors.white,
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) =>  Root()),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                const Spacer(),
                const Padding(
                  padding: EdgeInsets.only(bottom: 55),
                  child: Center(
                    child: CustomText(
                      size: 12,
                      color: Colors.white,
                      text: '@RichSonic2025',
                      weight: FontWeight.bold,
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
