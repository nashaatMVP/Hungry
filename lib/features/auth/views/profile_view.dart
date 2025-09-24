import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:huungry/core/constants/app_colors.dart';
import 'package:huungry/features/auth/widgets/custom_user_txt_field.dart';
import '../../../shared/custom_text.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _address = TextEditingController();

  @override
  void initState() {
    _name.text = 'Knuckles';
    _email.text = 'Knuckles@gmail.com';
    _address.text = '55 Dubai, UAE';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: AppColors.primary,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Gap(80),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Icon(Icons.arrow_back , color: Colors.white),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                      child: SvgPicture.asset('assets/icon/settings.svg', width: 20),
                    ),
                  ],
                ),
                Center(
                  child: Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage('assets/test/kunckles.jpg') , fit: BoxFit.cover),
                      border: Border.all(width: 5 , color: Colors.white),
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),






                ),
                Gap(30),
                CustomUserTxtField(
                    controller: _name,
                    label: 'Name',
                ),
                Gap(25),
                CustomUserTxtField(
                  controller: _email,
                  label: 'Email',
                ),
                Gap(25),
                CustomUserTxtField(
                  controller: _address,
                  label: 'Address',
                ),
                Gap(20),
                Divider(),
                Gap(10),
                ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  tileColor: Color(0xffF3F4F6),
                  contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                  leading: Image.asset('assets/icon/profileVisa.png', width: 50),
                  title: CustomText(text: 'Debit card',color: Colors.black),
                  subtitle: CustomText(text: '**** ***** 2342',color: Colors.black),
                  trailing: CustomText(text: 'Default',color: Colors.black),
                ),
                Gap(400),
              ],
            ),
          ),
        ),

        bottomSheet: Container(
          height: 70,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade800,
                blurRadius: 20,
              ),
            ]
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                /// Edit Button
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30,vertical: 15),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(8),

                  ),
                  child: Row(
                    children: [
                      CustomText(text: 'Edit Profile', weight: FontWeight.bold, color: Colors.white),
                      Gap(5),
                      Icon(CupertinoIcons.pencil, color: Colors.white),
                    ],
                  ),
                ),

                /// logout
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30,vertical: 15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: AppColors.primary),
                    borderRadius: BorderRadius.circular(8),

                  ),
                  child: Row(
                    children: [
                      CustomText(text: 'Logout', weight: FontWeight.bold, color: AppColors.primary),
                      Gap(5),
                      Icon(Icons.logout, color: AppColors.primary),
                    ],
                  )
                ),
              ],
            ),
          ),


        ),
      ),
    );
  }
}
