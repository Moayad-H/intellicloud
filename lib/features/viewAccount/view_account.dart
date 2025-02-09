import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intellicloud/app_assets/app_assets.dart';
import 'package:intellicloud/app_colors/color_constants.dart';
import 'package:intellicloud/app_colors/colors.dart';
import 'package:intellicloud/controllers/authentication/auth_cubit.dart';
import 'package:lottie/lottie.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AuthCubit authCubit = AuthCubit.get(context);
    return BlocConsumer<AuthCubit, AuthState>(
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
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Profile',
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                          color: AppColors.mintGreen,
                          letterSpacing: 1.2,
                        ),
                  ),
                ],
              ),
              Divider(
                color: AppColors.textLightGray.withAlpha(50),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        color: secondaryColor,
                        borderRadius: BorderRadius.circular(10)),
                    width: 500,
                    height: 250,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextFormField(
                          readOnly: true,
                          initialValue: authCubit.loggedUser?.name ?? 'Name',
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
                        TextFormField(
                          readOnly: true,
                          initialValue: authCubit.loggedUser?.email ?? 'Email',
                          keyboardType: TextInputType.emailAddress,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
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
                        ),
                        Row(
                          children: [
                            Text('Cluster Status: '),
                            Text(
                              'Connected!',
                              style: TextStyle(color: AppColors.mintGreen),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                      width: 500,
                      height: 500,
                      child: Lottie.asset(AppAssets.profileAnim))
                ],
              ),
            ],
          );
        }
      },
    );
  }
}
