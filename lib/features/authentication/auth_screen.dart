import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intellicloud/app_assets/app_assets.dart';
import 'package:intellicloud/app_colors/color_constants.dart';
import 'package:intellicloud/app_colors/colors.dart';
import 'package:intellicloud/controllers/authentication/auth_cubit.dart';
import 'package:lottie/lottie.dart';

class AuthScreen extends StatefulWidget {
  AuthScreen({super.key});

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  bool _isExpanded = false;
  bool _expandContainer = false;
  bool _isLoading = false;
  bool _isObscure = true;
  final _formKey = GlobalKey<FormState>();
  final RegExp _emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.red,
                content: Text(
                  state.message,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Center(
              child: Form(
                key: _formKey,
                child: AnimatedContainer(
                  curve: Curves.easeOut,
                  onEnd: () => setState(() {
                    _isExpanded = _expandContainer;
                    _isLoading = false;
                  }),
                  duration: Duration(milliseconds: 500),
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: secondaryColor,
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(1, 0),
                            spreadRadius: 1,
                            blurRadius: 4,
                            color: Colors.grey.shade800),
                      ],
                      borderRadius: BorderRadius.circular(10)),
                  width: _expandContainer ? 600 : 500,
                  height: _expandContainer ? 500 : 400,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                width: 100,
                                height: 100,
                                AppAssets.intelliCloudLogo,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'IntelliCloud',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineLarge
                                    ?.copyWith(
                                      color: AppColors.mintGreen,
                                    ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                          SizedBox(
                              width: 100,
                              height: 100,
                              child: Lottie.asset(AppAssets.loginLottie)),
                        ],
                      ),
                      if (_isExpanded)
                        TextFormField(
                          controller: _nameController,
                          decoration: InputDecoration(
                            floatingLabelStyle:
                                TextStyle(color: AppColors.lightGray),
                            fillColor: AppColors.darkTeal,
                            icon: Icon(
                              Icons.person,
                              color: AppColors.mintGreen,
                            ),
                            labelText: 'Name',
                          ),
                          validator: (value) =>
                              value!.isEmpty ? 'Name required' : null,
                        ),
                      if (_isExpanded) SizedBox(height: 10),
                      TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        inputFormatters: [
                          FilteringTextInputFormatter.deny(RegExp(r'\s')),
                        ],
                        decoration: InputDecoration(
                          floatingLabelStyle:
                              TextStyle(color: AppColors.lightGray),
                          icon: Icon(Icons.email, color: AppColors.mintGreen),
                          labelText: 'Email',
                          fillColor: AppColors.darkTeal,
                          errorStyle: TextStyle(color: AppColors.errorRed),
                          errorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: AppColors.errorRed),
                          ),
                          focusedErrorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: AppColors.errorRed),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter an email address';
                          }
                          if (!_emailRegex.hasMatch(value)) {
                            return 'Please enter a valid email address';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: _isObscure,
                        validator: (value) =>
                            value!.isEmpty ? 'Password required' : null,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                              onPressed: () => setState(() {
                                    _isObscure = !_isObscure;
                                  }),
                              icon: Icon(_isObscure
                                  ? Icons.visibility_off
                                  : Icons.visibility)),
                          floatingLabelStyle:
                              TextStyle(color: AppColors.lightGray),
                          icon: Icon(Icons.lock, color: AppColors.mintGreen),
                          fillColor: AppColors.darkTeal,
                          labelText: 'Password',
                        ),
                      ),
                      SizedBox(height: 20),
                      _isLoading
                          ? const CircularProgressIndicator()
                          : Container(
                              width: 100,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.softCyan.withAlpha(80),
                                    spreadRadius: 2,
                                    blurRadius: 1,
                                  )
                                ],
                                color: AppColors.mintGreen.withAlpha(100),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4)),
                              ),
                              child: TextButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    if (_isExpanded) {
                                      context.read<AuthCubit>().register(
                                            _emailController.text,
                                            _passwordController.text,
                                            _nameController.text,
                                          );
                                    } else {
                                      context.read<AuthCubit>().login(
                                            _emailController.text,
                                            _passwordController.text,
                                          );
                                    }
                                  }
                                },
                                child: Text(
                                  _isExpanded ? 'Register' : 'Login',
                                  style: Theme.of(context).textTheme.labelLarge,
                                ),
                              ),
                            ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(_isExpanded == true
                              ? 'Already Have an Account ? '
                              : 'No Account ? '),
                          InkWell(
                            onTap: () {
                              setState(() {
                                _formKey.currentState?.reset();
                                _expandContainer = !_expandContainer;
                                _isLoading = true;
                                if (_expandContainer == false) {
                                  _isExpanded = false;
                                }
                              });
                            },
                            child: Text(
                                ' ${_isExpanded == false ? 'Create one!' : 'Login Instead'}',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                      color: AppColors.mintGreen,
                                    )),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
