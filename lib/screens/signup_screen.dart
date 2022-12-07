import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../configs/defined_colors.dart';
import '../providers/app_provider.dart';
import '../static/constants.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});
  static final _signupFormKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    AppProvider app = AppProvider.state(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        toolbarHeight: AppConstants.toolbarHeightDefault,
        elevation: 0,
        title: Text("One last step!", style: app.text.h1),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            FormBuilder(
              key: _signupFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Email address",
                    style: app.text.t2.copyWith(color: gotoTextColorDark),
                  ),
                  SizedBox(height: app.space.y4),
                  FormBuilderTextField(
                    name: 'email',
                    cursorColor: textColorGrey,
                    textCapitalization: TextCapitalization.sentences,
                    style: app.text.t2,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 6, vertical: 6),
                      filled: true,
                      fillColor: fieldContrastDark,
                      hintText: 'Enter your email address',
                      hintStyle: app.text.t2.copyWith(color: textColorGrey),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: fieldContrastDark),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.email(),
                      FormBuilderValidators.required()
                    ]),
                  ),
                  SizedBox(height: app.space.y3),
                  Text(
                    "Password",
                    style: app.text.t2.copyWith(color: gotoTextColorDark),
                  ),
                  SizedBox(height: app.space.y4),
                  FormBuilderTextField(
                    obscureText: true,
                    name: 'password',
                    cursorColor: textColorGrey,
                    textCapitalization: TextCapitalization.sentences,
                    style: app.text.t2,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 6, vertical: 6),
                      filled: true,
                      fillColor: fieldContrastDark,
                      hintText: 'Enter your password',
                      hintStyle: app.text.t2.copyWith(color: textColorGrey),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: fieldContrastDark),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.minLength(6),
                      FormBuilderValidators.required()
                    ]),
                  ),
                  SizedBox(height: app.space.y3),
                  Text(
                    "Confirm Password",
                    style: app.text.t2.copyWith(color: gotoTextColorDark),
                  ),
                  SizedBox(height: app.space.y4),
                  FormBuilderTextField(
                    obscureText: true,
                    name: 'confirmPassword',
                    cursorColor: textColorGrey,
                    textCapitalization: TextCapitalization.sentences,
                    style: app.text.t2,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 6, vertical: 6),
                      filled: true,
                      fillColor: fieldContrastDark,
                      hintText: 'Confirm your password',
                      hintStyle: app.text.t2.copyWith(color: textColorGrey),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: fieldContrastDark),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.minLength(6),
                      FormBuilderValidators.required()
                    ]),
                  ),

                  SizedBox(height: app.space.y2),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: app.space.y1,
                    child: ElevatedButton(
                        onPressed: () {}, child: const Text("Sign up")),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
