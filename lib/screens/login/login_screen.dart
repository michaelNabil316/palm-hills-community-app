import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:palm_hills/helper/navigation.dart';
import 'package:palm_hills/shared_components/custom_buttons/button_large.dart';
import 'package:palm_hills/shared_components/custom_text.dart';
import '../../helper/phone_flages/phone_number_txtformfield.dart';
import '../../shared_components/custom_app_bars/app_bar_multiline.dart';
import '../../shared_components/custom_text_form_field.dart';
import '../../shared_components/note_error_container.dart';
import '../../helper/styles.dart';
import '../create_account/join_palm_hills_screen.dart';
import '../forget_password/forget_password_screen.dart';
import '../home/main_page_bottom_nav.dart';
import 'controller/login_controller.dart';
import 'widgets/local_auth_dialog.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMultinLine(
          title: "WELCOME BACK!",
          subtitle: "Log In to Your Account",
          noBackArrow: true),
      body: SingleChildScrollView(
        child: GetBuilder<LoginCtrl>(
          init: LoginCtrl(),
          builder: (con) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Form(
                key: loginFormKey,
                child: Column(
                  children: [
                    SizedBox(height: 45.h),
                    PhoneTextField(
                      controller: con.mobileController,
                      changeSelectedDialCode: con.changeSelectedDialCode,
                      suffix: SizedBox(),
                    ),
                    SizedBox(height: 20.h),
                    CustomTextFormField(
                      isPassword: con.hidePass,
                      label: "Password*",
                      textInputType: TextInputType.text,
                      controller: con.passwordController,
                      validate: (value) {
                        if (value == null) {
                          return "Field is required";
                        }
                        if (value.isEmpty) {
                          return "Field is required";
                        }
                      },
                      suffix: GestureDetector(
                        onTap: con.changehidePass,
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: SvgPicture.asset(
                              "assets/icons/${con.hidePass ? "closed_eye.svg" : "opened_eye.svg"}"),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            navigateTo(context, ForgetPasswordScreen());
                          },
                          child: CustomText(
                            text: "Forgot Password?",
                            color: AppColors.primary,
                            fontFamily: AppFontNames.gillSansBold,
                            size: 14.sp,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    if (con.errorMsg != "") ErrorContainer(text: con.errorMsg),
                    SizedBox(height: 20.h),
                    CustomLargeButton(
                      onPressed: () async {
                        FocusScope.of(context).unfocus();
                        if (loginFormKey.currentState?.validate() == true) {
                          final isUserExist = await con.loginProcess();
                          if (isUserExist == true) {
                            navigateTo(context, MainPageBottomNav());
                            con.clearData();
                          }
                        }
                      },
                      text: "Log In",
                    ),
                    SizedBox(height: 30.h),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          "assets/icons/face-id.svg",
                          height: 22.h,
                        ),
                        SizedBox(width: 8.w),
                        Column(
                          children: [
                            SizedBox(height: 3.h),
                            GestureDetector(
                              onTap: () {
                                showDialog<void>(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return LocalAuthDialog();
                                    });
                              },
                              child: CustomText(
                                text: "FaceID Login",
                                underline: true,
                                fontFamily: AppFontNames.gillSansBold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 210.h),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CustomText(
                          text: "Don't have an account yet?",
                          size: 14.sp,
                        ),
                        SizedBox(width: 2.w),
                        GestureDetector(
                          onTap: () async {
                            navigateTo(context, JoinPalmHillsScreen());
                          },
                          child: CustomText(
                            text: "Create Account",
                            fontFamily: AppFontNames.gillSansBold,
                            color: AppColors.primary,
                            size: 14.sp,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
