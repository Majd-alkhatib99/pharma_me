import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharma_me/core/models/medicine_model.dart';
import 'package:pharma_me/core/models/search_model.dart';
import 'package:pharma_me/core/models/warehouses_model.dart';
import 'package:pharma_me/core/util/api_serves.dart';
import 'package:pharma_me/core/util/cache_serves.dart';
import 'package:pharma_me/core/util/end_point.dart';
import 'package:pharma_me/screen/home/layout/search_layout/search_layout.dart';
import 'package:pharma_me/screen/home/layout/order_layout/order_layout.dart';
import 'package:pharma_me/screen/home/layout/warehouse_layout/warehouse_layout.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainInitial());

  static MainCubit get(context) => BlocProvider.of(context);

  List<Widget> homeLayout = [
    const WarehouseLayout(),
    const SearchLayout(),
    const OrderLayout()
  ];
  List<String> appBarTitle = [
    'Warehouses',
    'Categories',
    'My Orders',
  ];
  int bottomNavBarIndex = 0;

  void changeBottomNavBarIndex(int index) {
    bottomNavBarIndex = index;
    emit(ChangeBottomNavBarState());
  }

  bool isDarkMode = false;
  String? token = CacheServes.getData(key: 'token');
  List<WarehouseModel> warehouseModel = [];

  void getWarehouses() {
    warehouseModel = [];
    emit(LoadingGetWarehouseState());
    ApiServes.get(url: EndPoint.getWarehouse, token: token).then((response) {
      for (Map<String, dynamic> items in response.data) {
        warehouseModel.add(WarehouseModel.fromJson(items));
      }
      emit(SuccessGetWarehouseState());
    }).catchError((error) {
      emit(ErrorGetWarehouseState(error.toString()));
    });
  }

  List<String> medicineCat = [
    'All',
    'Syrups',
    'Pills',
    'Injections',
    'Ointments',
  ];

  List<String> catImage = [
    'categories/syrups.jpg',
    'categories/Pills.jpg',
    'categories/Injections.jpg',
    'categories/Ointments.jpg',
  ];

  int catIndex = 0;

  void changeCatIndex({required int catIndex, required int warehouseId}) {
    this.catIndex = catIndex;
    if (catIndex == 0) {
      emit(ChangeCatIndexState());
      getMedicineFromWarehouse(warehouseId: warehouseId - 1);
    } else {
      emit(ChangeCatIndexState());
      getCatMedicineFromWarehouse(catIndex: catIndex, warehouseId: warehouseId);
    }
  }

  List<MedicineModel> medicineModelList = [];

  void getMedicineFromWarehouse({required int warehouseId}) {
    medicineModelList = [];
    emit(LoadingGetMedicineFromWarehouse());
    ApiServes.get(
            url: '${EndPoint.getMedicineFromWarehouse}/${warehouseId + 1}',
            token: token)
        .then((response) {
      for (Map<String, dynamic> items in response.data) {
        medicineModelList.add(MedicineModel.fromJson(items));
      }
      emit(SuccessGetMedicineFromWarehouse());
    }).catchError((error) {
      emit(ErrorGetMedicineFromWarehouse(error.toString()));
    });
  }

  List<MedicineModel> medicineModelList2 = [];

  void getCatMedicineFromWarehouse(
      {required int warehouseId, required int catIndex}) {
    medicineModelList2 = [];
    emit(LoadingGetCatMedicineFromWarehouse());
    ApiServes.get(
            url:
                '${EndPoint.getCatMedicineFromWarehouse}/$catIndex/$warehouseId',
            token: token)
        .then((response) {
      for (Map<String, dynamic> items in response.data) {
        medicineModelList2.add(MedicineModel.fromJson(items));
      }
      for (int i = 0; i < medicineModelList2.length; i++) {
        medicineModelList2[i].category = Category(
            id: catIndex,
            catName: medicineCat[catIndex],
            image: catImage[catIndex - 1]);
      }
      emit(SuccessGetCatMedicineFromWarehouse());
    }).catchError((error) {
      emit(ErrorGetCatMedicineFromWarehouse(error.toString()));
    });
  }

  TextEditingController searchController = TextEditingController();
  List<SearchModel> searchModel =[];
  void searchMedicines({required String keyword}) {
    searchModel =[];
    emit(LoadingSearchState());

    ApiServes.get(
            url: EndPoint.searchMedicines,
            query: {'keyword': keyword},
            token: token)
        .then((response) {
          for(Map<String,dynamic> items in response.data){
            searchModel.add(SearchModel.fromJson(items));
          }
          print(searchModel[0].scName);
      emit(SuccessSearchState());
    }).catchError((error) {
      emit(ErrorSearchState(error.toString()));
    });
  }
}
