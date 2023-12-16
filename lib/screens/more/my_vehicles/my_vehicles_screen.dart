import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:palm_hills/screens/more/my_vehicles/widgets/add_vehicle_bottom_sheet.dart';
import '../../../helper/navigation.dart';
import '../../../shared_components/custom_app_bars/app_bar_one_line_with_icon.dart';
import '../../../shared_components/loader_widget.dart';
import '../../home/main_page_bottom_nav.dart';
import '../../home/sections/custom_bottom_nav.dart';
import '../../home/sections/floating_action_button.dart';
import 'controller/vehicle_controller.dart';
import 'widgets/delete_dialog.dart';
import 'widgets/no_vehicles_section.dart';
import 'widgets/vehicle_card.dart';
import 'widgets/vehivles_switch_compound.dart';

class VehiclesScreen extends StatelessWidget {
  const VehiclesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VehicleCtrl>(
      init: VehicleCtrl(),
      builder: (con) {
        return Scaffold(
          extendBody: true,
          floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
          floatingActionButton: FloatingActionButoonCustomization(),
          bottomNavigationBar: CustomBottomNav(
            onTapFromSubScreen: () {
              navigateAndFinish(context, MainPageBottomNav());
            },
          ),
          appBar: appBarOneLineWithIcon(
            title: "MY VEHICLES",
            onPressPluskBtn: () {
              showModalBottomSheet<void>(
                isScrollControlled: true,
                context: context,
                builder: (BuildContext context) {
                  return AddVehicleBottomSheet();
                },
              );
            },
            onPressBackBtn: () => Navigator.pop(context),
          ),
          body: con.loadingData
              ? LoadingData()
              : SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.w),
                    child: Column(
                      children: [
                        if (con.myVehicles.isEmpty) NoVehiclesSection(),
                        if (con.myVehicles.isNotEmpty) SizedBox(height: 30.h),
                        ListView.separated(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) => VehicleCard(
                            vehicle: con.myVehicles[index],
                            onDelete: () {
                              showDialog<void>(
                                context: context,
                                builder: (BuildContext context) {
                                  return DeleteVehicleDialog(
                                    onDelete: () {
                                      con.deleteVehicle(
                                          index, con.myVehicles[index].id);
                                    },
                                  );
                                },
                              );
                            },
                            onEdit: () {
                              showModalBottomSheet<void>(
                                isScrollControlled: true,
                                context: context,
                                builder: (BuildContext context) {
                                  return AddVehicleBottomSheet(
                                    data: con.myVehicles[index],
                                  );
                                },
                              );
                            },
                          ),
                          itemCount: con.myVehicles.length,
                          separatorBuilder: (context, index) =>
                              SizedBox(height: 25.h),
                        ),
                        SizedBox(height: 30.h),
                        VehicleSwitchCompound(),
                      ],
                    ),
                  ),
                ),
        );
      },
    );
  }
}
