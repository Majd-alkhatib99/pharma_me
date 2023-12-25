import 'package:flutter/material.dart';
import 'package:pharma_me/core/manager/auth_cubit/auth_cubit.dart';
import 'package:pharma_me/core/util/theme.dart';
import 'package:pharma_me/core/widgets/custom_button.dart';
import 'package:pharma_me/core/widgets/custom_text.dart';
import 'package:pharma_me/core/widgets/custom_textfield.dart';

class FormLoginBody extends StatelessWidget {
  const FormLoginBody({super.key, required this.cubit, required this.state});

  final AuthCubit cubit;
  final AuthState state;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: cubit.formLoginKey,
      child: Column(
        children: [
          CustomTextFormField(
            enabled: state is LoadingLoginState? false:true,
            textColor: ConvertThemeMode.convertText(cubit.isDarkMode),
            primeColor: ConvertThemeMode.convertPrimeColor(cubit.isDarkMode),
            text: 'Phone Number',
            hint: 'Ex: 0912345678',
            textInputType: TextInputType.phone,
            textEditingController: cubit.phoneController,
            onSave: (value) {
              //controller.email = value;
            },
            validator: (value) {
              if (value!.isEmpty) {
                return 'Pleas enter your phone number';
              }
              if (value.contains('09') == false) {
                return 'Please enter a valid phone number';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 40,
          ),
          CustomTextFormField(
            enabled: state is LoadingLoginState? false:true,
            textColor: ConvertThemeMode.convertText(cubit.isDarkMode),
            primeColor: ConvertThemeMode.convertPrimeColor(cubit.isDarkMode),
            text: 'Password',
            hint: '**********',
            textInputType: TextInputType.visiblePassword,
            textEditingController: cubit.passwordController,
            obscureText: cubit.isShowPassword,
            icon: IconButton(
              icon: Icon(
                cubit.passwordIcon,
              ),
              onPressed: () {
                cubit.showPassword();
              },
            ),
            onSave: (value) {
              //controller.password = value;
            },
            validator: (value) {
              if (value!.isEmpty) {
                return 'Pleas enter your password';
              }
              if (value.length < 8) {
                return 'Please enter at least 8 characters';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 20,
          ),
          CustomText(
            text: 'Forgot Password?',
            isBold: true,
            color: ConvertThemeMode.convertText(cubit.isDarkMode),
            fontSize: 14,
            alignment: Alignment.topRight,
          ),
          const SizedBox(
            height: 30,
          ),
          state is LoadingLoginState
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : CustomButton(
                  onPress: () {
                    if (cubit.formLoginKey.currentState!.validate()) {
                      cubit.loginUser(
                          loginName: cubit.phoneController.text,
                          password: cubit.passwordController.text);
                    }
                  },
                  color: ConvertThemeMode.convertPrimeColor(cubit.isDarkMode),
                  text: 'Login',
                  textColor: ConvertThemeMode.convertText(cubit.isDarkMode),
                ),
        ],
      ),
    );
  }
}
