import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharma_me/core/models/medicine_model.dart';
import 'package:pharma_me/core/models/warehouses_model.dart';
import 'package:pharma_me/core/util/api_serves.dart';
import 'package:pharma_me/core/util/cache_serves.dart';
import 'package:pharma_me/core/util/end_point.dart';
import 'package:pharma_me/screen/home/layout/categories_layout/categories_layout.dart';
import 'package:pharma_me/screen/home/layout/order_layout/order_layout.dart';
import 'package:pharma_me/screen/home/layout/warehouse_layout/warehouse_layout.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainInitial());

  static MainCubit get(context) => BlocProvider.of(context);

  List<Widget> homeLayout = [
    const WarehouseLayout(),
    const CategoriesLayout(),
    const OrderLayout()
  ];
  List<String> appBarTitle = [
    'Warehouse',
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
  String token2 =
      'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiODhhYTcyMTRkODdiMDU0YjBiNDY3NjY5YTlhMTE5ZjU5ZGYwYjk3OWQ1ZWM0YjBmNDExMzAwMWMxMmZjYzhhZjAxMDFjNTY4MTVkYTViOGIiLCJpYXQiOjE3MDM0OTUxNzIuMzQ5MDM0LCJuYmYiOjE3MDM0OTUxNzIuMzQ5MDM3LCJleHAiOjE3MzUxMTc1NzIuMzE5OTUyLCJzdWIiOiIxMCIsInNjb3BlcyI6W119.LRVNjYYC3wgzTytFM1TDqE0spx-mYJ_BAeHd6SMuz38mcKPQ5JDgfn-XuB3T1ZPKWWiFdTp4AuNTLHmlkd-DJfKjDbe8z_fPyOl4Rb6nN3mJjwTclHKh9bDfI1Ox8WxfStJFAN1TFXV6p-v5Z8-Ds_LIy4cF9P9r3cG10nOCTKltu6AMIDYN079punn46a7RfwCFiRTUS9uZIitVMNso-Vraggal1Eu_Ml-WVAfSdk84kcEGlIdrSXnUiYlW36g7kRXunBq2HE7OWyvSg4_UwsInGw0OsJJCEq8n0Pp6dLNfeuWpPgbTJZIhFMiCl-qvz8hpVidaquGHZpNuN1Wcqu2soBdsWT1T6Vd3oU7VNuzF35JxxQ04556CQ-XMv9ayO0zQ6JYezBWdhnkvvvzy8AUUwENPQ5T0eC3PZh9EqrGK2PkbWq_4R4xfBdkV8eoywlxiKJlLVYRtO34i8xpiZZaeLXD6PxO9TygdcsWoS5vChBcitcba6qTR8I6NuCBS34YNHRVs5STPgcPlAOAQ34Y5J5FR8QJt9ZOe-dXhqHm1a3cRm_gDokgWq8YKPaKKksRqab1u81lI8wxh-LJ0Z2W98HqmwzShKPQHotK3Y-2YLKgs4-PYFgpHDQuICaRo8Har_PahMmG2JgdoFW8vbtLmVfUCx9q-flRQqh1GezA';
  List<WarehouseModel> warehouseModel = [];

  void getWarehouses() {
    emit(LoadingGetWarehouseState());
    ApiServes.get(url: EndPoint.getWarehouse, token: token).then((response) {
      for (Map<String, dynamic> items in response.data) {
        warehouseModel.add(WarehouseModel.fromJson(items));
      }
      emit(SuccessGetWarehouseState());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorGetWarehouseState(error.toString()));
    });
  }



  List<MedicineModel> medicineModelList = [];

  void getMedicineFromWarehouse(int id) {
    medicineModelList = [];
    emit(LoadingGetMedicineFromWarehouse());

    ApiServes.get(
            url: '${EndPoint.getMedicineFromWarehouse}/${id + 1}', token: token)
        .then((response) {
      for (Map<String, dynamic> items in response.data) {
        medicineModelList.add(MedicineModel.fromJson(items));
      }
      emit(SuccessGetMedicineFromWarehouse());
    }).catchError((error) {
      emit(ErrorGetMedicineFromWarehouse(error.toString()));
    });
  }

  List<String> medicineCat = [
    'All',
    'Syrups',
    'Pills',
    'Injections',
    'Ointments',
  ];

  int catIndex = 0;

  void changeCatIndex({required int catIndex,required int warehouseId}) {
    this.catIndex = catIndex;
    if(catIndex==0){
      getMedicineFromWarehouse(warehouseId);
    }
    else{
      getCatMedicineFromWarehouse(catIndex: catIndex,warehouseId: warehouseId);
    }
    emit(ChangeCatIndexState());
  }
  void getCatMedicineFromWarehouse({required int warehouseId,required int catIndex}) {
    medicineModelList = [];
    emit(LoadingGetCatMedicineFromWarehouse());
    ApiServes.get(url: '${EndPoint.getCatMedicineFromWarehouse}/$catIndex/$warehouseId',token: token)
        .then((response) {
            for (Map<String, dynamic> items in response.data) {
              medicineModelList.add(MedicineModel.fromJson(items));
            }
            emit(SuccessGetCatMedicineFromWarehouse());
          })
        .catchError((error) {
          print(error.toString());
          emit(ErrorGetCatMedicineFromWarehouse(error.toString()));
    });
  }
}
