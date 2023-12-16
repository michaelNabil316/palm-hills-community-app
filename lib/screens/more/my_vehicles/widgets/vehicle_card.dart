import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:palm_hills/screens/more/my_vehicles/model/vehicle_model.dart';
import 'package:palm_hills/shared_components/custom_text.dart';
import 'package:palm_hills/helper/styles.dart';

class VehicleCard extends StatelessWidget {
  final Function() onDelete;
  final Function() onEdit;
  final VehiclesModel vehicle;

  const VehicleCard({
    super.key,
    required this.onDelete,
    required this.onEdit,
    required this.vehicle,
  });

  @override
  Widget build(BuildContext context) {
    return Slidable(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(width: 1, color: Colors.grey.shade300)),
        padding: EdgeInsets.all(22),
        child: Column(
          children: [
            Row(
              children: [
                CustomText(
                  text:
                      "${vehicle.makeName ?? ""} ${vehicle.model ?? ""} ${vehicle.year ?? ""}",
                  isBold: true,
                ),
                SizedBox(width: 10.w),
                Container(
                  padding: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                      color: (vehicle.statuscode == 1
                              ? Colors.grey
                              : vehicle.statuscode == 2
                                  ? Colors.green
                                  : Colors.red)
                          .withOpacity(0.4),
                      border: Border.all(width: 1, color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(12)),
                  child: CustomText(
                    text: vehicle.statuscode == 1
                        ? "Pending"
                        : vehicle.statuscode == 2
                            ? "Approved"
                            : "Rejected",
                    color: vehicle.statuscode == 1
                        ? Colors.grey
                        : vehicle.statuscode == 2
                            ? Colors.green
                            : Colors.red,
                    size: 12.sp,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                SvgPicture.asset("assets/icons/person_logo.svg"),
                SizedBox(width: 10.w),
                CustomText(
                  text: "${vehicle.relatedownerValue ?? "Empty"}",
                  color: Colors.grey,
                ),
              ],
            ),
            Row(
              children: [
                SvgPicture.asset(
                  "assets/icons/car.svg",
                  color: AppColors.secondaryText,
                ),
                SizedBox(width: 10.w),
                CustomText(
                  text: vehicle.paletteText ?? "Empty",
                  color: Colors.grey,
                ),
              ],
            ),
          ],
        ),
      ),
      endActionPane: ActionPane(
        motion: const StretchMotion(),
        children: [
          SlidableAction(
            backgroundColor: Colors.grey.shade100,
            onPressed: (context) => onEdit(),
            icon: Icons.edit_square,
            foregroundColor: Colors.red,
          ),
          SlidableAction(
            backgroundColor: Colors.red,
            onPressed: (context) => onDelete(),
            icon: Icons.delete_outline,
          ),
        ],
      ),
    );
  }
}
