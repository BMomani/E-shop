import 'package:e_shop/presentation/resources/asset_manager.dart';
import 'package:e_shop/presentation/resources/color_manager.dart';
import 'package:e_shop/presentation/resources/font_manager.dart';
import 'package:e_shop/presentation/resources/reusable/Primary_button.dart';
import 'package:e_shop/presentation/resources/reusable/custom_text_form_filed.dart';
import 'package:e_shop/presentation/resources/reusable/sign_divider.dart';
import 'package:e_shop/presentation/resources/reusable/social_btton.dart';
import 'package:e_shop/presentation/resources/text_style_manager.dart';
import 'package:e_shop/presentation/resources/value_manager.dart';
import 'package:e_shop/presentation/views/authentication_view/forget_password.dart';
import 'package:e_shop/presentation/views/authentication_view/register_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
            left: AppPaddingManager.p16,
            right: AppPaddingManager.p16,
            top: AppPaddingManager.p52),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                tr("signInButton"),
                style: Theme.of(context).textTheme.headline6,
              ),
              SizedBox(
                height: AppSizeManager.s11.h,
              ),
              Text(
                tr("signInSubtitle"),
                style: TextStyleManager.getMediumTextStyle(
                  color: ColorManager.registerSubtitle,
                  letterSpacing: 0,
                  fontSize: FontSizeManager.s14.sp,
                ),
              ),
              SizedBox(
                height: AppSizeManager.s25.h,
              ),
              Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTextFormFiled(
                      validator: (value) {},
                      keyboardType: TextInputType.emailAddress,
                      icon: Icons.email_outlined,
                      label: tr("email"),
                    ),
                    CustomTextFormFiled(
                      validator: (value) {},
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      icon: Icons.lock_outline_rounded,
                      label: tr("password"),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: AppSizeManager.s30.h,
              ),
              Row(
                children: [
                  GestureDetector(
                    child: Icon(
                      Icons.check_box_outline_blank,
                      color: ColorManager.accentFontColor,
                      size: FontSizeManager.s14.sp,
                    ),
                  ),
                  const SizedBox(
                    width: AppSizeManager.s10,
                  ),
                  Text(
                    tr("rememberMe"),
                    style: TextStyleManager.getMediumTextStyle(
                      color: ColorManager.haveAccountTextColor,
                      letterSpacing: 0,
                      fontSize: FontSizeManager.s14.sp,
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ForgetPasswordView(),
                        ),
                      );
                    },
                    child: Text(
                      tr("forgetPasswordTextButton"),
                      style: TextStyleManager.getMediumTextStyle(
                        color: ColorManager.textButtonColor,
                        letterSpacing: 0,
                        fontSize: FontSizeManager.s14.sp,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: AppSizeManager.s30.h,
              ),
              PrimaryButton(
                width: (AppSizeManager.sWidth - AppSizeManager.s16 * 2).w,
                buttonTitle: tr("signInButton"),
                onPress: () {},
              ),
              SizedBox(
                height: AppSizeManager.s28.h,
              ),
              SignDivider(text: tr("orSignInWith")),
              SizedBox(
                height: AppSizeManager.s28.h,
              ),
              SocialButton(
                text: tr("google"),
                icon: SvgPicture.asset(
                  ImageManager.google,
                  width: AppSizeManager.s18.w,
                  height: AppSizeManager.s18.h,
                  color: ColorManager.accentFontColor,
                ),
                width: (AppSizeManager.sWidth - AppSizeManager.s16 * 2).w,
              ),
              SizedBox(
                height: AppSizeManager.s28.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SocialButton(
                    text: tr("facebook"),
                    icon: SvgPicture.asset(
                      ImageManager.facebook,
                      width: AppSizeManager.s18.w,
                      height: AppSizeManager.s18.h,
                      color: ColorManager.accentFontColor,
                    ),
                    width: AppSizeManager.s170.w,
                  ),
                  SocialButton(
                    text: tr("apple"),
                    icon: SvgPicture.asset(
                      ImageManager.apple,
                      width: AppSizeManager.s18.w,
                      height: AppSizeManager.s18.h,
                      color: ColorManager.accentFontColor,
                    ),
                    width: AppSizeManager.s170.w,
                  ),
                ],
              ),
              const SizedBox(
                height: AppSizeManager.s170,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    tr("alreadyHaveAccount"),
                    style: TextStyleManager.getMediumTextStyle(
                        fontSize: 12,
                        letterSpacing: 0,
                        color: ColorManager.haveAccountTextColor),
                  ),
                  SizedBox(
                    width: AppSizeManager.s10.w,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegisterView(),
                        ),
                      );
                    },
                    child: Text(
                      tr("signUpButton"),
                      style: TextStyleManager.getMediumTextStyle(
                          fontSize: 12,
                          letterSpacing: 0,
                          color: ColorManager.textButtonColor),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
