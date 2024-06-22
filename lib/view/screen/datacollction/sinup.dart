// ignore_for_file: non_constant_identifier_names, prefer_const_constructors, curly_braces_in_flow_control_structures, unnecessary_null_comparison

import 'package:chat_app/controller/API_Hendal/Sinup_API_Controller.dart';
import 'package:chat_app/controller/statehendle/SinupController/sinup_controller.dart';
import 'package:chat_app/controller/statehendle/SinupController/vaildation_controller.dart';
import 'package:chat_app/view/color.dart';
import 'package:chat_app/view/icons.dart';
import 'package:chat_app/view/string.dart';
import 'package:chat_app/view/utils/widgets/sinup/dropdown.dart';
import 'package:chat_app/view/utils/widgets/sinup/textfild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../modal/cuntry.dart';
import '../menu/commnications/commnications.dart';

class Sinup extends StatefulWidget {
  const Sinup({super.key});

  @override
  State<Sinup> createState() => _SinupState();
}

class _SinupState extends State<Sinup> {
  String? selectedCountry;
  String? selectedState;
  String? selectedCity;
  SinupApiController Create = Get.put(SinupApiController());

  String selectedGender = '';

  void selectGender(String gender) {
    setState(() {
      selectedGender = gender;
    });
  }

  DateTime selectedDate = DateTime.now();

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  bool isvis = false;

  @override
  Widget build(BuildContext context) {
    final Sinup_Con = Provider.of<SinupController>(context, listen: false);
    final vali = Provider.of<VaildationController>(context, listen: false);
    return Scaffold(
      body: Container(
        width: Get.width,
        height: Get.height,
        decoration: BoxDecoration(
          color: AppColor.background_color,
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Get.width / 20,
            ),
            child: Consumer<VaildationController>(
              builder: (BuildContext context, value, Widget? child) {
                return SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Consumer<SinupController>(
                    builder: (BuildContext context, value, Widget? child) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            Sinup_String.heding,
                            style: TextStyle(
                              fontFamily: GoogleFonts.cherrySwash().fontFamily,
                              color: AppColor.button_color,
                              fontSize: Get.width / 9,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            Sinup_String.subheding,
                            style: TextStyle(
                              color: AppColor.subtext_color,
                              fontFamily: GoogleFonts.exo().fontFamily,
                              fontSize: Get.width / 23,
                            ),
                          ),
                          SizedBox(height: Get.height / 30),

                          //Full Name
                          Textfilds(
                            Textfild: Sinup_Con.fullname,
                            onTap: () {
                              Sinup_Con.Full_Name_Boder();
                            },
                            fildname: Sinup_String.Full_Name,
                            hinttext: Sinup_String.Enter_Full_Name,
                            controller: vali.fullname_controller,
                          ),
                          (vali.Full_Name_condition)
                              ? Text(
                                  (vali.Full_Name_condition)
                                      ? vali.Fullname_Error
                                      : '',
                                  style: TextStyle(
                                    color: AppColor.Error_color,
                                  ),
                                )
                              : SizedBox(),
                          SizedBox(height: Get.height / 50),

                          //Phone
                          Phonefild(
                            controller: vali.phone_controller,
                            Textfild: Sinup_Con.phone,
                            onTap: () {
                              Sinup_Con.PhoneNumber_Boder();
                            },
                          ),
                          (vali.Phone_condition)
                              ? Text(
                                  (vali.Phone_condition)
                                      ? vali.Phone_Error
                                      : '',
                                  style: TextStyle(
                                    color: AppColor.Error_color,
                                  ),
                                )
                              : SizedBox(),
                          SizedBox(height: Get.height / 70),

                          //Email
                          Textfilds(
                            Textfild: Sinup_Con.email,
                            onTap: () {
                              Sinup_Con.EmailAddress_Boder();
                            },
                            fildname: Sinup_String.Email_address,
                            hinttext: Sinup_String.Enter_Email_address,
                            controller: vali.email_controller,
                          ),
                          (vali.Email_condition)
                              ? Text(
                                  (vali.Email_condition)
                                      ? vali.Email_Error
                                      : '',
                                  style: TextStyle(
                                    color: AppColor.Error_color,
                                  ),
                                )
                              : SizedBox(),
                          SizedBox(height: Get.height / 70),

                          //Password
                          Textfilds(
                            obscureText: isvis,
                            suffixIcon: (isvis)
                                ? Icon(
                                    Icons.visibility_off,
                                    color: AppColor.active_Textfild_color,
                                  )
                                : Icon(
                                    Icons.visibility,
                                    color: AppColor.active_Textfild_color,
                                  ),
                            Textfild: Sinup_Con.password,
                            onTap: () {
                              Sinup_Con.Password_Boder();
                              setState(() {
                                isvis = !isvis;
                              });
                            },
                            fildname: Sinup_String.Password,
                            hinttext: Sinup_String.Password,
                            controller: vali.password_controller,
                          ),
                          (vali.Password_condition)
                              ? Text(
                                  (vali.Password_condition)
                                      ? vali.Password_Error
                                      : '',
                                  style: TextStyle(
                                    color: AppColor.Error_color,
                                  ),
                                )
                              : SizedBox(),
                          SizedBox(height: Get.height / 70),

                          //Address
                          Text(
                            Sinup_String.Address,
                            style: TextStyle(
                              color: AppColor.button_color,
                              fontFamily: GoogleFonts.exo().fontFamily,
                              fontSize: Get.width / 21,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: Get.height / 70),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(Get.width / 50),
                              color: (Sinup_Con.Address)
                                  ? AppColor.Textfild_color
                                  : AppColor.text_color,
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(5),
                              child: Container(
                                height: Get.height / 8,
                                width: Get.width,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(Get.width / 50),
                                  border: Border.all(
                                    color: (Sinup_Con.Address)
                                        ? AppColor.active_Textfild_color
                                        : AppColor.deactive_Textfild_color,
                                  ),
                                ),
                                child: TextField(
                                  controller: vali.Address_controller,
                                  onTap: () {
                                    Sinup_Con.Address_Boder();
                                  },
                                  decoration: InputDecoration(
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          (vali.Address_condition)
                              ? Text(
                                  (vali.Address_condition)
                                      ? vali.Adress_Error
                                      : '',
                                  style: TextStyle(
                                    color: AppColor.Error_color,
                                  ),
                                )
                              : SizedBox(),
                          SizedBox(height: Get.height / 70),

                          //Country
                          Dropdown_menu(
                            icon: SvgPicture.asset(AppIcons.down_svg),
                            onChanged: (String? newValue) {
                              selectedCountry = newValue;
                              selectedState = null;
                              selectedCity = null;
                            },
                            onTap: () {
                              Sinup_Con.Country_Boder();
                            },
                            Textfild: Sinup_Con.country,
                            drop_name: Sinup_String.Country,
                            items: countryStateCityMap.keys
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                          SizedBox(height: Get.height / 70),

                          //State
                          Dropdown_menu(
                            icon: SvgPicture.asset(AppIcons.down_svg),
                            onTap: () {
                              Sinup_Con.State_Boder();
                            },
                            onChanged: selectedCountry == null
                                ? null
                                : (String? newValue) {
                                    setState(() {
                                      selectedState = newValue;
                                      selectedCity = null;
                                    });
                                  },
                            Textfild: Sinup_Con.State,
                            drop_name: Sinup_String.State,
                            items: selectedCountry == null
                                ? []
                                : countryStateCityMap[selectedCountry!]!
                                    .map<DropdownMenuItem<String>>(
                                        (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                          ),
                          SizedBox(height: Get.height / 70),

                          //City
                          Dropdown_menu(
                            icon: SvgPicture.asset(AppIcons.down_svg),
                            onTap: () {
                              Sinup_Con.City_Boder();
                            },
                            onChanged: selectedState == null
                                ? null
                                : (String? newValue) {
                                    setState(() {
                                      selectedCity = newValue;
                                    });
                                  },
                            Textfild: Sinup_Con.city,
                            drop_name: Sinup_String.City,
                            items: selectedState == null
                                ? []
                                : stateCityMap[selectedState!]!
                                    .map<DropdownMenuItem<String>>(
                                        (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                          ),
                          SizedBox(height: Get.height / 70),

                          //Postal Code
                          Textfilds(
                            Textfild: Sinup_Con.postal,
                            onTap: () {
                              Sinup_Con.Postal_code();
                            },
                            fildname: Sinup_String.Postal_Code,
                            hinttext: Sinup_String.Postal_Code,
                            controller: vali.postal_controller,
                          ),
                          (vali.postal_condition)
                              ? Text(
                                  (vali.postal_condition)
                                      ? vali.postal_Error
                                      : '',
                                  style: TextStyle(
                                    color: AppColor.Error_color,
                                  ),
                                )
                              : SizedBox(),
                          SizedBox(height: Get.height / 70),

                          //Date
                          Text(
                            Sinup_String.Phone,
                            style: TextStyle(
                              color: AppColor.button_color,
                              fontFamily: GoogleFonts.exo().fontFamily,
                              fontSize: Get.width / 21,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: Get.height / 70),
                          GestureDetector(
                            onTap: () async {
                              Sinup_Con.Date_Boder();
                              final DateTime? picked = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1900),
                                lastDate: DateTime(2101),
                              );
                              if (picked != null && picked != selectedDate)
                                setState(() {
                                  selectedDate = picked;
                                });
                            },
                            child: Container(
                              height: Get.height / 14,
                              width: Get.width,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(Get.width / 50),
                                color: (Sinup_Con.Date)
                                    ? AppColor.Textfild_color
                                    : AppColor.text_color,
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(5),
                                child: Container(
                                  width: Get.width,
                                  height: Get.height / 15,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(Get.width / 50),
                                    border: Border.all(
                                      color: (Sinup_Con.Date)
                                          ? AppColor.active_Textfild_color
                                          : AppColor.deactive_Textfild_color,
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: Get.width / 30),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              selectedDate == null
                                                  ? 'Select date'
                                                  : '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}',
                                              style: TextStyle(
                                                fontFamily: GoogleFonts.exo()
                                                    .fontFamily,
                                                fontSize: Get.width / 21,
                                                color: AppColor
                                                    .deactive_Textfild_color,
                                              ),
                                            ),
                                            SvgPicture.asset(AppIcons.date),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: Get.height / 70),
                          Text(
                            Sinup_String.Gender,
                            style: TextStyle(
                              color: AppColor.button_color,
                              fontFamily: GoogleFonts.exo().fontFamily,
                              fontSize: Get.width / 21,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    Radio(
                                      activeColor: AppColor.button_color,
                                      value: 'male',
                                      groupValue: selectedGender,
                                      onChanged: (value) {
                                        selectGender(value.toString());
                                      },
                                    ),
                                    Text(
                                      Sinup_String.Male,
                                      style: TextStyle(
                                        fontSize: Get.width / 25,
                                        color: AppColor.deactive_Textfild_color,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  children: [
                                    Radio(
                                      activeColor: AppColor.button_color,
                                      value: 'female',
                                      groupValue: selectedGender,
                                      onChanged: (value) {
                                        selectGender(value.toString());
                                      },
                                    ),
                                    Text(
                                      Sinup_String.Female,
                                      style: TextStyle(
                                        fontSize: Get.width / 25,
                                        color: AppColor.deactive_Textfild_color,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  children: [
                                    Radio(
                                      activeColor: AppColor.button_color,
                                      value: 'other',
                                      groupValue: selectedGender,
                                      onChanged: (value) {
                                        selectGender(value.toString());
                                      },
                                    ),
                                    Text(
                                      Sinup_String.Prefer_not_to_say,
                                      style: TextStyle(
                                        fontSize: Get.width / 25,
                                        color: AppColor.deactive_Textfild_color,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: Get.height / 30),
                          GestureDetector(
                            onTap: () {
                              vali.Validation();
                              Create.SinupApiController_faction(
                                  fullName: vali.fullname_controller.text,
                                  email: vali.email_controller.text,
                                  phone: vali.phone_controller.text,
                                  gender: selectedGender.toString(),
                                  address: vali.Address_controller.text,
                                  city: selectedCity.toString(),
                                  state: selectedState.toString(),
                                  dateOfBirth: selectedDate.toString(),
                                );

                            },
                            child: Container(
                              width: Get.width,
                              height: Get.height / 15,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  Get.width / 50,
                                ),
                                color: AppColor.active_Textfild_color,
                              ),
                              child: Center(
                                child: Text(
                                  Sinup_String.Create_Account,
                                  style: TextStyle(
                                    fontFamily:
                                        GoogleFonts.openSans().fontFamily,
                                    fontSize: Get.width / 18,
                                    color: AppColor.text_color,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: Get.height / 50),
                        ],
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
