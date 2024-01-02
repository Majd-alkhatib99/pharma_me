import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pharma_me/core/manager/auth_cubit/auth_cubit.dart';
import 'package:pharma_me/core/util/cache_serves.dart';
import 'package:pharma_me/core/util/custom_function.dart';
import 'widgets/form_login_body.dart';
import 'widgets/header_login_body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) async {
          if (state is ErrorLoginState) {
            CustomFunction.showSnackBar(
                message:
                    'Incorrect information, Please enter correct information',
                context: context,
                mode: AuthCubit.get(context).isDarkMode);
          }
          if (state is SuccessLoginState) {
            CustomFunction.showSnackBar(
                message: '${state.user.message}, Welcome ${state.user.name}',
                context: context,
                mode: AuthCubit.get(context).isDarkMode);
            await CacheServes.saveData(key: 'token', value: state.user.token)
                .then((value) {
              GoRouter.of(context).pushReplacement('/HomeScreen');
            });
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
                    HeaderLoginBody(cubit: cubit),
                    FormLoginBody(
                      cubit: cubit,
                      state: state,
                    ),
                  ],
                ),
              ),
            ),
          ));
        },
      ),
    );
  }
}
