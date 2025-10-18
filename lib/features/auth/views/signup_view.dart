import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:huungry/core/network/api_error.dart';
import 'package:huungry/features/auth/data/auth_repo.dart';
import 'package:huungry/features/auth/views/login_view.dart';
import 'package:huungry/features/auth/widgets/custom_btn.dart';
import 'package:huungry/root.dart';
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
        child: Scaffold(
          appBar: AppBar(toolbarHeight: 0.0, backgroundColor: Colors.white),
          backgroundColor: Colors.white,
          body: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Gap(100),
                  SvgPicture.asset('assets/logo/logo.svg' , color: AppColors.primary),
                  Gap(10),
                  Center(child: CustomText(text: 'Welcome to our Food App' , color: AppColors.primary)),
                  Gap(40),
                  glassContainer(child: Column(
                      children: [
                        Gap(30),
                        CustomTxtfield(
                          controller: nameController,
                          hint: 'Name',
                          isPassword: false,
                        ),
                        Gap(10),
                        CustomTxtfield(
                          controller: emailController,
                          hint: 'Email Address',
                          isPassword: false,
                        ),
                        Gap(10),
                        CustomTxtfield(
                          controller: passController,
                          hint: 'Password',
                          isPassword: true,
                        ),
                        Gap(20),

                        /// Sign up
                        isLoading ? CupertinoActivityIndicator() : CustomAuthBtn(
                          color: AppColors.primary,
                          textColor: Colors.white,
                          text: 'Sign up',
                          onTap: signup,
                        ),

                        Gap(10),
                        Row(
                          children: [
                            ///  Login
                            Expanded(
                              child:   CustomAuthBtn(
                                textColor: AppColors.primary,
                                color: Colors.white,
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
                                color: Colors.white,
                                textColor: AppColors.primary,
                                text: 'Guest',
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (c) {
                                        return Root();
                                      },
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                        Gap(10),
                      ],
                    )),
                  Gap(150),
                  CustomText(text: '@RichSonic2025', color: AppColors.primary, size: 12, weight: FontWeight.bold),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
