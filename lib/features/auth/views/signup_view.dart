import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:huungry/core/network/api_error.dart';
import 'package:huungry/features/auth/data/auth_repo.dart';
import 'package:huungry/features/auth/views/login_view.dart';
import 'package:huungry/features/auth/widgets/custom_btn.dart';
import 'package:huungry/root.dart';
import 'package:huungry/shared/custom_button.dart';
import 'package:huungry/shared/glass_container.dart';
import '../../../core/constants/app_colors.dart';
import '../../../shared/custom_snack.dart';
import '../../../shared/custom_text.dart';
import '../../../shared/custom_txtfield.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isLoading = false;
  AuthRepo authRepo = AuthRepo();
  Future<void> signup () async {
    if(formKey.currentState!.validate()) {
      try {
        setState(() => isLoading = true);
        final user = await authRepo.signup(nameController.text.trim(), emailController.text.trim(), passController.text.trim());
        if(user != null) {
          Navigator.push(context, MaterialPageRoute(builder: (c) => Root()));
        }
        setState(() => isLoading = false);

      } catch (e) {
        setState(() => isLoading = false);
        String errMsg = 'Error in Register';
        if(e is ApiError) {
          errMsg = e.message;
        }
        ScaffoldMessenger.of(context).showSnackBar(customSnack(errMsg));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: glassContainer(
          child: Scaffold(
            backgroundColor: Colors.transparent, 
            body: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Gap(140),
                    SvgPicture.asset('assets/logo/logo.svg' , color: Colors.white70),
                    Gap(10),
                    Center(child: CustomText(text: 'Welcome to our Food App' , color: Colors.white70)),
                    Gap(40),
                    Column(
                      children: [
                        Gap(30),
                        CustomTxtfield(
                          controller: nameController,
                          hint: 'Name',
                          isPassword: false,
                        ),
                        Gap(8),
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
          
                        /// Sign up
                        CustomButton(
                          height: 45,
                          gap: 10,
                          widget: isLoading ? CupertinoActivityIndicator(color: AppColors.primary,) : null,
                          color: Colors.white,
                          textColor: AppColors.primary,
                          text: 'Sign up',
                          onTap: signup,
                        ),
          
                        Gap(20),
                        Row(
                          children: [
                            ///  Login
                            Expanded(
                              child:   CustomAuthBtn(
                                color: Colors.transparent,
                                textColor: Colors.white,
                                text: 'Login',
                                onTap: () {
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (c) {
                                    return LoginView();
                                  }));
                                },
                              ),
                            ),
                            Gap(15),
                            /// Guest
                            Expanded(
                              child: CustomAuthBtn(
                                color: Colors.transparent,
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
                      ],
                    ),
                    Gap(290),
                    CustomText(text: '@RichSonic2025', color: Colors.white, size: 12, weight: FontWeight.bold),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
