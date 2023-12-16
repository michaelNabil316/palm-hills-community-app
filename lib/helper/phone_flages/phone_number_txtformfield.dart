import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:palm_hills/helper/styles.dart';
import '../../shared_components/custom_text.dart';
import '../../shared_components/custom_text_form_field.dart';
import 'countries.dart';
import 'flag_prefix.dart';

class PhoneTextField extends StatefulWidget {
  final TextEditingController controller;
  final Widget? suffix;
  final String? lable;
  final bool? showPrefix;
  final bool? readOnly;
  final Color? fillColor;
  final Function? changeSelectedDialCode;
  final Function(String)? onChange;
  const PhoneTextField({
    super.key,
    required this.controller,
    this.changeSelectedDialCode,
    this.suffix,
    this.lable,
    this.showPrefix,
    this.readOnly,
    this.fillColor,
    this.onChange,
  });

  @override
  State<PhoneTextField> createState() => _PhoneTextFieldState();
}

class _PhoneTextFieldState extends State<PhoneTextField> {
  Country selectedCountry = CountriesHelper.countries[64];
  List<Country> filteredCountries = CountriesHelper.countries;
  bool isFocused = false;

  changeFocus(bool state) {
    setState(() {
      isFocused = state;
    });
  }

  @override
  void initState() {
    super.initState();
    if (widget.showPrefix == true) {
      changeFocus(true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      readOnly: widget.readOnly,
      fillColor: widget.fillColor,
      label: widget.lable ?? "Mobile Number*",
      textInputType: TextInputType.number,
      controller: widget.controller,
      onChange: widget.onChange,
      fontSize: 16.sp,
      validate: (value) {
        if (value == null) {
          return "Field is required";
        }
        if (value.length > selectedCountry.maxLength ||
            value.length < selectedCountry.minLength) {
          return "Mobile number seems not be correct";
        }
        return null;
      },
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp('[\u0600-\u06FF 0-9]')),
      ],
      onTap: () {
        changeFocus(true);
      },
      // suffix: widget.suffix ??
      // CustomToolTipSimple(
      //   richMessage: TextSpan(
      //     children: [
      //       WidgetSpan(
      //           child: SvgPicture.asset("assets/icons/hint_lamp.svg")),
      //       TextSpan(
      //         text:
      //             " Make sure you're using the same phone number as the one registered with Palm Hills.",
      //         style: TextStyle(
      //             color: Colors.grey,
      //             fontSize: 12.sp,
      //             fontFamily: AppFontNames.gillSansMedium),
      //       ),
      //     ],
      //   ),
      //   childWidget: Padding(
      //     padding: const EdgeInsets.all(12),
      //     child: SvgPicture.asset("assets/icons/exclamation_mark.svg"),
      //   ),
      // ),
      prefix: isFocused
          ? GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  useRootNavigator: false,
                  builder: (context) => Dialog(
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 10.h),
                        const CustomText(
                            text: "Select Country",
                            fontFamily: AppFontNames.gillSansBold),
                        SizedBox(height: 10.h),
                        Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: CountriesHelper.countries.length,
                            itemBuilder: (ctx, index) => ListTile(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: -20, horizontal: 15),
                              leading: Text(
                                CountriesHelper.countries[index].flag,
                              ),
                              title: Row(
                                children: [
                                  Expanded(
                                    child: CustomText(
                                      textAlign: TextAlign.start,
                                      text:
                                          CountriesHelper.countries[index].name,
                                    ),
                                  ),
                                ],
                              ),
                              trailing: CustomText(
                                text:
                                    '+${CountriesHelper.countries[index].dialCode}',
                              ),
                              onTap: () {
                                if (widget.changeSelectedDialCode != null) {
                                  widget.changeSelectedDialCode!(CountriesHelper
                                      .countries[index].dialCode);
                                }
                                setState(() {
                                  selectedCountry =
                                      CountriesHelper.countries[index];
                                });
                                Navigator.pop(context);
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              child: FlagPrefix(selectedCountry: selectedCountry),
            )
          : null,
    );
  }
}
