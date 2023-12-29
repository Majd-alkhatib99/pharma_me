import 'package:flutter/material.dart';
import 'package:pharma_me/core/manager/auth_cubit/auth_cubit.dart';
import 'package:pharma_me/core/util/theme.dart';
import 'package:pharma_me/core/widgets/custom_button.dart';
import 'package:pharma_me/core/widgets/custom_textfield.dart';

class FormRegisterBody extends StatelessWidget {
  const FormRegisterBody({super.key, required this.cubit, required this.state});

  final AuthCubit cubit;
  final AuthState state;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: cubit.formRegisterKey,
      child: Column(
        children: [
          CustomTextFormField(
            textColor: ConvertThemeMode.convertText(cubit.isDarkMode),
            primeColor: ConvertThemeMode.convertPrimeColor(cubit.isDarkMode),
            text: 'Name',
            hint: 'Kinan',
            textInputType: TextInputType.name,
            textEditingController: cubit.nameRegisterController,
            onSave: (value) {},
            validator: (value) {
              if (value!.isEmpty) {
                return 'Pleas enter your name';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 40,
          ),
          CustomTextFormField(
            textColor: ConvertThemeMode.convertText(cubit.isDarkMode),
            primeColor: ConvertThemeMode.convertPrimeColor(cubit.isDarkMode),
            text: 'Phone Number',
            hint: 'Ex: 0912345678',
            textInputType: TextInputType.phone,
            textEditingController: cubit.phoneRegisterController,
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
            textColor: ConvertThemeMode.convertText(cubit.isDarkMode),
            primeColor: ConvertThemeMode.convertPrimeColor(cubit.isDarkMode),
            text: 'Email',
            hint: 'Example@mail.com',
            textInputType: TextInputType.emailAddress,
            textEditingController: cubit.emailRegisterController,
            onSave: (value) {
              //controller.email = value;
            },
            validator: (value) {
              if (value!.isEmpty) {
                return 'Pleas enter your Email';
              }
              if (value.contains('@') == false ||
                  value.contains('.com') == false) {
                return 'Please enter a valid email';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 40,
          ),
          CustomTextFormField(
            textColor: ConvertThemeMode.convertText(cubit.isDarkMode),
            primeColor: ConvertThemeMode.convertPrimeColor(cubit.isDarkMode),
            text: 'Password',
            hint: '**********',
            textInputType: TextInputType.visiblePassword,
            textEditingController: cubit.passwordRegisterController,
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
            onFieldSubmitted: (value){
              if (cubit.formRegisterKey.currentState!.validate()) {
                cubit.registerUser(
                    name: cubit.nameRegisterController.text,
                    email: cubit.emailRegisterController.text,
                    phone: cubit.phoneRegisterController.text,
                    password: cubit.passwordRegisterController.text);
              }
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
            height: 30,
          ),
          state is LoadingRegisterState
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : CustomButton(
                  onPress: () {
                    if (cubit.formRegisterKey.currentState!.validate()) {
                      cubit.registerUser(
                          name: cubit.nameRegisterController.text,
                          email: cubit.emailRegisterController.text,
                          phone: cubit.phoneRegisterController.text,
                          password: cubit.passwordRegisterController.text);
                    }
                  },
                  color: ConvertThemeMode.convertPrimeColor(cubit.isDarkMode),
                  text: 'Register',
                  textColor: ConvertThemeMode.convertText(cubit.isDarkMode),
                ),
        ],
      ),
    );
  }
}
