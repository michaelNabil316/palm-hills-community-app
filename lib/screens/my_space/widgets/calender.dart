import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:palm_hills/shared_components/custom_text.dart';
import 'package:intl/intl.dart';
import 'package:date_utils/date_utils.dart' as du;
import 'package:palm_hills/helper/styles.dart';
import '../../../helper/constants.dart';
import '../controllers/my_space_controller.dart';

class CustomCalender extends StatelessWidget {
  const CustomCalender({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MySpaceController>(
      init: MySpaceController(),
      builder: (con) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (String data in daysOfWeek)
              SizedBox(
                width: 1.sw / 8,
                child: Column(
                  children: <Widget>[
                        CustomText(
                          text: data,
                          size: 16.sp,
                          color: Colors.grey,
                        ),
                      ] +
                      du.DateUtils.daysInMonth(con.selectedMonth)
                          .where(
                            (element) =>
                                DateFormat('E').format(element) == data,
                          )
                          .map(
                            (date) => GestureDetector(
                              onTap: () {
                                con.changeSelectedDay(date);
                              },
                              child: SizedBox(
                                height: 1.sh / 20,
                                child: CircleAvatar(
                                  backgroundColor: con.selectedday == date
                                      ? AppColors.primary
                                      : Colors.white,
                                  radius: 15.r,
                                  child: CustomText(
                                    text: DateFormat('d').format(date),
                                    color: date.month != con.selectedMonth.month
                                        ? Colors.white
                                        : con.selectedday == date
                                            ? Colors.white
                                            : AppColors.secondaryText,
                                  ),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                ),
              ),
          ],
        );
      },
    );
  }
}
