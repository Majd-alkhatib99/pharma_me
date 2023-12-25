import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pharma_me/core/manager/auth_cubit/auth_cubit.dart';
import 'package:pharma_me/core/util/custom_function.dart';
import 'package:pharma_me/screen/auth/register/widgets/form_register_body.dart';
import 'package:pharma_me/screen/auth/register/widgets/header_register_body.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is ErrorRegisterState) {
              CustomFunction.showSnackBar(
                  message: 'This email or phone number has already been taken',
                  context: context,
                mode: AuthCubit.get(context).isDarkMode
              );
            }
            if (state is SuccessRegisterState) {
              CustomFunction.showSnackBar(
                  message: '${state.message}, please login now',
                  context: context,mode: AuthCubit.get(context).isDarkMode);
              GoRouter.of(context).pushReplacement('/LoginScreen');
            }
          },
          builder: (context, state) {
            var cubit = AuthCubit.get(context);
            return Scaffold(
              body: Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 50, right: 20, left: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        HeaderRegisterBody(
                          cubit: cubit,
                        ),
                        FormRegisterBody(
                          cubit: cubit,
                          state: state,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ));
  }
}
