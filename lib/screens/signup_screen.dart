import 'package:farmgo/blocs/user%20bloc/bloc/user_state.dart';
import 'package:farmgo/utils/snackbar_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../blocs/user bloc/bloc/user_bloc.dart';
import '../configs/defined_colors.dart';
import '../providers/app_provider.dart';
import '../static/constants.dart';

class SignupScreen extends StatefulWidget {
  final String fullname;
  final String username;
  final String contact;

  const SignupScreen(
      {required this.fullname,
      required this.username,
      required this.contact,
      super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  static final _signupFormKey = GlobalKey<FormBuilderState>();
  late bool isInvestor;
  late AppProvider app;

  @override
  void initState() {
    isInvestor = false;
    app = AppProvider.state(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserBloc, UserState>(
      listener: (context, state) {
        if (state is UserSignupFailed) {
          SnackbarUtils.displaySnackbar(context, 'error', state.message!);
        } else if (state is UserSignupSuccess) {
          SnackbarUtils.displaySnackbar(context, 'not error', state.message!);
        }
      },
      child: Scaffold(
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Login as an investor?",
                            style:
                                app.text.t2.copyWith(color: gotoTextColorDark)),
                        StatefulBuilder(builder: (context, setState) {
                          return Checkbox(
                            value: isInvestor,
                            onChanged: (value) {
                              setState(() {
                                isInvestor = value!;
                              });
                            },
                          );
                        }),
                      ],
                    ),
                    SizedBox(height: app.space.y2),
                    BlocBuilder<UserBloc, UserState>(builder: (context, state) {
                      if (state is UserSignupLoading) {
                        return Center(
                          child: CircularProgressIndicator(
                            color: gotoTextColorDark,
                          ),
                        );
                      } else {
                        return SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: app.space.y1,
                          child: ElevatedButton(
                              onPressed: () {
                                BlocProvider.of<UserBloc>(context).add(
                                    UserSignup(
                                        username: widget.username,
                                        contact: widget.contact,
                                        name: widget.fullname,
                                        email: _signupFormKey.currentState!
                                            .fields['email']!.value
                                            .toString()
                                            .trim(),
                                        password: _signupFormKey.currentState!
                                            .fields['password']!.value
                                            .toString()
                                            .trim(),
                                        isInvestor: isInvestor));
                              },
                              child: const Text("Sign up")),
                        );
                      }
                    }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
