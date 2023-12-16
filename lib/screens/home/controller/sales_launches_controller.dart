import 'package:get/get.dart';
import '../../../repository/home_repository.dart';
import '../models/sales_launches_model.dart';

class SalesLaunchesController extends GetxController {
  List<SalesLaunchesModel> salesLaunchesList = [];
  List<String> salesLaunchesCompoundsList = [];
  int selectedCarouselIndex = 0;
  int salesLaunchesSelectedIndex = 0;

  @override
  void onInit() {
    super.onInit();
    getSalesLaunches();
  }

  getSalesLaunches() async {
    salesLaunchesList = [];
    salesLaunchesCompoundsList = [];
    update();
    final response = await HomeApi.getSalesLaunches();
    if (response.errorFlag == false) {
      for (var el in response.values['value']) {
        salesLaunchesList.add(SalesLaunchesModel.fromJson(el));
        if (el[compoundRecordName] != null) {
          bool isContainName =
              salesLaunchesCompoundsList.contains(el[compoundRecordName]);
          if (isContainName == false) {
            salesLaunchesCompoundsList.add(el[compoundRecordName]);
          }
        }
      }
    }
    update();
  }

  void SetTabIndex(int value) {
    salesLaunchesSelectedIndex = value;
    selectedCarouselIndex = 0;
    update();
  }

  List<SalesLaunchesModel> getListOfFilterdSalesLaunches() {
    List<SalesLaunchesModel> filteredData = [];
    for (var el in salesLaunchesList) {
      if (el.compoundName ==
          salesLaunchesCompoundsList[salesLaunchesSelectedIndex]) {
        filteredData.add(el);
      }
    }
    return filteredData;
  }

  changeSelectedCarousel(index) {
    selectedCarouselIndex = index;
    update();
  }
}

String compoundRecordName =
    "_com_compound_value@OData.Community.Display.V1.FormattedValue";
