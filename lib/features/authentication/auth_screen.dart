import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intellicloud/app_assets/app_assets.dart';
import 'package:intellicloud/app_colors/color_constants.dart';
import 'package:intellicloud/app_colors/colors.dart';
import 'package:intellicloud/controllers/authentication/auth_cubit.dart';
import 'package:intellicloud/controllers/home_screen/dashboard_cubit.dart';
import 'package:intellicloud/routes/app_routes.dart';
import 'package:intellicloud/utils/app_loader.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          } else if (state is AuthAuthenticated) {
            DashboardCubit.get(context)
                .updateActiveTab(0, AppRoutes.startScreen, context);
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return Center(child: CircularProgressIndicator());
          }
          return Center(
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
              height: _expandContainer ? 450 : 350,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
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
                        style:
                            Theme.of(context).textTheme.headlineLarge?.copyWith(
                                  color: AppColors.mintGreen,
                                ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                  if (_isExpanded)
                    TextField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        floatingLabelStyle:
                            TextStyle(color: AppColors.lightGray),
                        icon: Icon(Icons.person),
                        labelText: 'Name',
                        fillColor: AppColors.darkTeal,
                      ),
                    ),
                  if (_isExpanded) SizedBox(height: 10),
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      floatingLabelStyle: TextStyle(color: AppColors.lightGray),
                      icon: Icon(Icons.email),
                      labelText: 'Email',
                      fillColor: AppColors.darkTeal,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      floatingLabelStyle: TextStyle(color: AppColors.lightGray),
                      icon: Icon(Icons.password),
                      labelText: 'Password',
                      fillColor: AppColors.darkTeal,
                    ),
                    obscureText: true,
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
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                          ),
                          child: TextButton(
                            onPressed: () {
                              _isExpanded == true
                                  ? context.read<AuthCubit>().register(
                                      _emailController.text,
                                      _passwordController.text,
                                      _nameController.text)
                                  : context.read<AuthCubit>().login(
                                        _emailController.text,
                                        _passwordController.text,
                                      );
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
          );
        },
      ),
    );
  }
}
