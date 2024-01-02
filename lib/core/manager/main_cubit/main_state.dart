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

class ChangeCatIndexState extends MainState{}

class LoadingGetCatMedicineFromWarehouse extends MainState{}
class SuccessGetCatMedicineFromWarehouse extends MainState{}
class ErrorGetCatMedicineFromWarehouse extends MainState{
  final String errorMessage;
  ErrorGetCatMedicineFromWarehouse(this.errorMessage);
}

class LoadingSearchState extends MainState{}
class SuccessSearchState extends MainState{}
class ErrorSearchState extends MainState{
  final String error;
  ErrorSearchState(this.error);
}

class ChangeCheckBoxState extends MainState{}

class ChangeQuantityState extends MainState{}

class LoadingCreateOrderState extends MainState{}
class SuccessCreateOrderState extends MainState{
  final String message;
  SuccessCreateOrderState(this.message);
}
class ErrorCreateOrderState extends MainState{
  final String error;
  ErrorCreateOrderState(this.error);
}

class LoadingGetOrderState extends MainState{}
class SuccessGetOrderState extends MainState{}
class ErrorGetOrderState extends MainState{
  final String error;
  ErrorGetOrderState(this.error);
}