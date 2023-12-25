part of 'main_cubit.dart';

@immutable
abstract class MainState {}

class MainInitial extends MainState {}

class ChangeBottomNavBarState extends MainState{}

class LoadingGetWarehouseState extends MainState{}
class SuccessGetWarehouseState extends MainState{}
class ErrorGetWarehouseState extends MainState{
  final String errorMessage;
  ErrorGetWarehouseState(this.errorMessage);
}

class LoadingGetMedicineFromWarehouse extends MainState{}
class SuccessGetMedicineFromWarehouse extends MainState{}
class ErrorGetMedicineFromWarehouse extends MainState{
  final String errorMessage;
  ErrorGetMedicineFromWarehouse(this.errorMessage);
}
