import 'package:flutter/material.dart';
import 'package:new_test_project/screens/login/provider/sign_in_provider.dart';
import 'package:new_test_project/widgets/app_bar/custom_app_bar.dart';
import 'package:provider/provider.dart';

import '../../core/image_constant.dart';
import '../../widgets/app_bar/appbar_subtitle.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_image_view.dart';
import '../../widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class ScreenLogin extends StatelessWidget {
  ScreenLogin({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: _buildAppBar(context),
        body: SizedBox(
          child: Form(
            key: _formKey,
            child: Container(
              width: double.maxFinite,
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 28,
              ),
              child: Consumer<SignInProvider>(
                  builder: (context, signInProvider, _) {
                return Column(
                  children: [
                    const SizedBox(height: 56),
                    CustomImageView(
                        imagePath: ImageConstant.imgSettings,
                        height: 42,
                        width: 35),
                    const Spacer(flex: 47),
                    CustomTextFormField(
                      controller: signInProvider.emailFieldController,
                      hintText: "Username, email or mobile number",
                      textInputType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 16),
                    CustomTextFormField(
                        controller: signInProvider.passwordFieldController,
                        hintText: "Password",
                        textInputAction: TextInputAction.done,
                        textInputType: TextInputType.visiblePassword,
                        obscureText: true),
                    const SizedBox(
                      height: 16,
                    ),
                    Consumer<SignInProvider>(
                        builder: (context, signInProvider, _) {
                      return CustomElevatedButton(
                        text: "Log in",
                        onPressed: () {
                          if (signInProvider
                                  .emailFieldController.text.isNotEmpty &&
                              signInProvider
                                  .passwordFieldController.text.isNotEmpty) {
                            signInProvider.loginUser(
                              context,
                              username:
                                  signInProvider.emailFieldController.text,
                              password:
                                  signInProvider.passwordFieldController.text,
                            );
                          } else if (signInProvider
                              .emailFieldController.text.isEmpty) {
                            showCustomSnackBar(
                              context: context,
                              message: "Enter your email and password",
                            );
                          } else {
                            showCustomSnackBar(
                              context: context,
                              message: "Enter your email and password",
                            );
                          }
                        },
                      );
                    }),
                    const Spacer(flex: 52),
                    CustomImageView(
                      imagePath: ImageConstant.imgMetaPlatformsIncLogo,
                      height: 13,
                      width: 66,
                    )
                  ],
                );
              }),
            ),
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      height: 70,
      centerTitle: true,
      title: AppbarSubtitle(
        text: "English (US)",
      ),
    );
  }
}
