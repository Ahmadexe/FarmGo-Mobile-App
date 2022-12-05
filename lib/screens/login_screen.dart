import 'package:farmgo/configs/defined_colors.dart';
import 'package:farmgo/providers/app_provider.dart';
import 'package:farmgo/static/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final _loginFormKey = GlobalKey<FormBuilderState>();
    AppProvider app = AppProvider.state(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: AppConstants.toolbarHeightDefault,
        elevation: 0,
        title: Text("Login", style: app.text.h1),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // SizedBox(height: app.space.y2),
            FormBuilder(
                key: _loginFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Login with email",
                      style: app.text.t2.copyWith(color: gotoTextColorDark),
                    ),
                    SizedBox(height: app.space.y4),
                    FormBuilderTextField(
                      name: 'email',
                      cursorColor: textColorGrey,
                      textCapitalization: TextCapitalization.sentences,
                      style: app.text.t2,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(horizontal: 6,vertical: 6),
                        filled: true,
                        fillColor: fieldContrastDark,
                        hintText: 'Enter your email',
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
                        contentPadding: const EdgeInsets.symmetric(horizontal: 6,vertical: 6),
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
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
