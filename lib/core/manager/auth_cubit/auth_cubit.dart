import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharma_me/core/util/api_serves.dart';
import 'package:pharma_me/core/util/end_point.dart';
import '../../models/user_model.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  static AuthCubit get(context) => BlocProvider.of(context);

  final GlobalKey<FormState> formLoginKey = GlobalKey<FormState>();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> formRegisterKey = GlobalKey<FormState>();
  final TextEditingController nameRegisterController = TextEditingController();
  final TextEditingController emailRegisterController = TextEditingController();
  final TextEditingController phoneRegisterController = TextEditingController();
  final TextEditingController passwordRegisterController =
      TextEditingController();
  final TextEditingController rePasswordRegisterController =
      TextEditingController();


  bool isShowPassword = true;
  IconData passwordIcon = Icons.visibility_outlined;

  void showPassword() {
    isShowPassword = !isShowPassword;
    isShowPassword
        ? passwordIcon = Icons.visibility_outlined
        : passwordIcon = Icons.visibility_off_outlined;
    emit(ShowPasswordState());
  }

  bool isDarkMode = false;

  UserModel? userModel;
  void loginUser({
    required String loginName,
    required String password,
  }) async {
    emit(LoadingLoginState());

    await ApiServes.postData(url: EndPoint.login, data: {
      'loginame': loginName,
      'password': password,
    }).then((response) {

      userModel = UserModel.fromJson(response);
      emit(SuccessLoginState(userModel!));
    }).onError((error, stackTrace) {

      emit(ErrorLoginState(error.toString()));
    });
  }




  void registerUser({
    required String name,
    required String email,
    required String phone,
    required String password,
  }) async {
    emit(LoadingRegisterState());

    await ApiServes.postData(url: EndPoint.register, data: {
      'name': name,
      'email': email,
      'phone': phone,
      'password': password,
    }).then((response) {
      emit(SuccessRegisterState(message: response['message']));
    }).catchError((error) {
      emit(ErrorRegisterState(error.toString()));
    });
  }
}




