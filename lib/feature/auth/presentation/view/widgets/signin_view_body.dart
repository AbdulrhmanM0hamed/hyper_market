import 'package:flutter/material.dart';
import 'package:hyper_market/core/utils/common/custom_text_form_field.dart';
import 'package:hyper_market/core/utils/common/elvated_button.dart';
import 'package:hyper_market/core/utils/common/password_field.dart';
import 'package:hyper_market/core/utils/constants/assets.dart';
import 'package:hyper_market/core/utils/constants/colors.dart';
import 'package:hyper_market/core/utils/constants/font_manger.dart';
import 'package:hyper_market/core/utils/constants/styles_manger.dart';
import 'package:hyper_market/feature/auth/presentation/view/forget_password.dart';
import 'package:hyper_market/feature/auth/presentation/view/widgets/custom_divider.dart';
import 'package:hyper_market/feature/auth/presentation/view/widgets/dont_have_account.dart';
import 'package:hyper_market/feature/auth/presentation/view/widgets/socail_button.dart';
import 'package:hyper_market/feature/home/presentation/view/home_view.dart';
import '../../../../../generated/l10n.dart';

class SigninViewBody extends StatefulWidget {
  const SigninViewBody({super.key});

  @override
  State<SigninViewBody> createState() => _SigninViewBodyState();
}

class _SigninViewBodyState extends State<SigninViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  late String email, password;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: size.height * 0.04,
          horizontal: size.width * 0.05,
        ),
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CustomTextFormField(
                onSaved: (value) => email = value!,
                hintText: S.current!.email,
                suffixIcon: const Icon(Icons.email),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              PasswordField(
                onSaved: (value) => password = value!,
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, ForgotPasswordView.routeName);
                },
                child: Text(
                  S.current!.forgotPassword,
                  style: getSemiBoldStyle(
                    fontFamily: FontConstant.cairo,
                    fontSize: FontSize.size14,
                    color: TColors.primary,
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              CustomElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, HomeView.routeName);
                  // Prefs.setBool(KIsloginSuccess, true);
                  // if (formKey.currentState!.validate()) {
                  //   formKey.currentState!.save();
                  //   context.read<SignInCubit>().signInWithEmailAndPassword(email, password);
                  // } else {
                  //   autovalidateMode = AutovalidateMode.onUserInteraction;
                  //   setState(() {});
                  // }
                },
                buttonText: S.current!.login,
              ),
              SizedBox(
                height: size.height * 0.025,
              ),
              const DontHaveAccount(),
              SizedBox(
                height: size.height * 0.05,
              ),
              const CustomDivider(),
              SizedBox(height: size.height * 0.025),
              Column(
                children: [
                  SocialButton(
                    onPressed: () {
                      // context.read<SignInCubit>().signInWithGoogle();
                    },
                    buttonText: "تسجيل بواسطة Google",
                    iconPath: AssetsManager.googleIcon,
                  ),
                  SizedBox(height: size.height * 0.015),
                  SocialButton(
                    onPressed: () {
                      // context.read<SignInCubit>().signInWithFacebook();
                    },
                    buttonText: "تسجيل بواسطة Facebook",
                    iconPath: AssetsManager.facebookIcon,
                  ),
                  SizedBox(height: size.height * 0.015),
                  SocialButton(
                    onPressed: () {},
                    buttonText: "تسجيل بواسطة Apple",
                    iconPath: AssetsManager.appleIcon,
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