import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharma_me/core/models/medicine_model.dart';
import 'package:pharma_me/core/models/order_model.dart';
import 'package:pharma_me/core/models/orders_model.dart';
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
    if(index==0){
      emit(ChangeBottomNavBarState());
      getWarehouses();

    }
    if(index == 1){

      searchController.clear();
      searchModel.clear();
      emit(ChangeBottomNavBarState());
    }
    if(index==2){
      emit(ChangeBottomNavBarState());
      getOrders();
    }


  }

  bool isDarkMode = false;
  String? token = CacheServes.getData(key: 'token');
  List<WarehouseModel> warehouseModel = [];

  Future<void> getWarehouses() async{
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
    'categories/pills.jpg',
    'categories/injections.jpg',
    'categories/ointments.jpg',
  ];

  int catIndex = 0;

  void changeCatIndex({required int catIndex, required int warehouseId}) {
    this.catIndex = catIndex;
    orders = [];
    if (catIndex == 0) {
      emit(ChangeCatIndexState());
      getMedicineFromWarehouse(warehouseId: warehouseId);
    } else {
      emit(ChangeCatIndexState());
      getCatMedicineFromWarehouse(catIndex: catIndex, warehouseId: warehouseId);
    }
  }

  List<MedicineModel> medicineModelList = [];

  Future<void> getMedicineFromWarehouse({required int warehouseId}) async{
    medicineModelList = [];
    checkBoxValue = [];
    emit(LoadingGetMedicineFromWarehouse());
    ApiServes.get(
            url: '${EndPoint.getMedicineFromWarehouse}/$warehouseId',
            token: token)
        .then((response) {
      for (Map<String, dynamic> items in response.data) {
        medicineModelList.add(MedicineModel.fromJson(items));
        checkBoxValue.add(false);
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
    checkBoxValue = [];
    emit(LoadingGetCatMedicineFromWarehouse());
    ApiServes.get(
            url:
                '${EndPoint.getCatMedicineFromWarehouse}/$catIndex/$warehouseId',
            token: token)
        .then((response) {
      for (Map<String, dynamic> items in response.data) {
        medicineModelList2.add(MedicineModel.fromJson(items));
        checkBoxValue.add(false);
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
  List<SearchModel> searchModel = [];

  void searchMedicines({required String keyword}) {
    searchModel = [];
    emit(LoadingSearchState());

    ApiServes.get(
            url: EndPoint.searchMedicines,
            query: {'keyword': keyword},
            token: token)
        .then((response) {
      for (Map<String, dynamic> items in response.data) {
        searchModel.add(SearchModel.fromJson(items));
      }
      emit(SuccessSearchState());
    }).catchError((error) {
      emit(ErrorSearchState(error.toString()));
    });
  }


  List<OrderModel> orders = [];
  List<bool> checkBoxValue = [];

  void changeCheckBoxState(bool value, int index) {

    checkBoxValue[index] = value;
    if (value) {
      orders.add(OrderModel(index, 0, medicineModelList[index].scName!));
      itemsQuantity.add(1);
    } else {
      for (int i = 0; i < orders.length; i++) {
        if (orders[i].medicineId == index) {
          itemsQuantity.removeAt(i);
          orders.removeAt(i);
        }
      }
    }

    emit(ChangeCheckBoxState());
  }

  GlobalKey<ScaffoldState> medicineScaffoldKey = GlobalKey<ScaffoldState>();
  List<int> itemsQuantity = [];

  void add(int index) {
    itemsQuantity[index]++;
    emit(ChangeQuantityState());
  }

  void sub(int index) {
    if (itemsQuantity[index] > 1) {
      itemsQuantity[index]--;
    }
    emit(ChangeQuantityState());
  }

  void submitOrder(int warehouseId) {
    List<Map<String, dynamic>> order = [];
    for (int i = 0; i < orders.length; i++) {
      orders[i].qty = itemsQuantity[i];
      order.add({
        'medicine_id':orders[i].medicineId!+1,
        'qty':orders[i].qty,
      });
    }
    emit(LoadingCreateOrderState());

    ApiServes.postData(
        url: '${EndPoint.createOrder}/$warehouseId',
        data: {
          'items':order,
        },
      token: token,
    ).then((response) {
      emit(SuccessCreateOrderState(response['message']));
      order=[];
    }).catchError((error) {
      emit(ErrorCreateOrderState(error.toString()));
    });

  }
  List<OrdersModel> ordersModel=[];
  Future<void> getOrders()async{
    ordersModel=[];
    emit(LoadingGetOrderState());

    ApiServes.get(url: EndPoint.getOrders,token: token)
        .then((response) {
          for(Map<String, dynamic> item in response.data){
            ordersModel.add(OrdersModel.fromJson(item));

          }
          for(int i =0;i<ordersModel.length;i++){
            if(ordersModel[i].status=='Sent'){
              ordersModel[i].image='assets/images/sent.json';
            }
            if(ordersModel[i].status=='Received'){
              ordersModel[i].image='assets/images/received.json';
            }
            if(ordersModel[i].status=='Preparation'){
              ordersModel[i].image='assets/images/preparation.json';
            }
          }
          emit(SuccessGetOrderState());
    })
        .catchError((error){
           emit(ErrorGetOrderState(error.toString()));

    });
  }
}
