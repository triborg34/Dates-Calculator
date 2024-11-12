
// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:Dates.Calculator/controller.dart';
import 'package:get/get.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';

class HomeScreen extends StatelessWidget {

  
 
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body:GetBuilder<mainController>(builder: (controller) {
        return Container(
        height: Get.height,
        width: Get.width,
        child: Center(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            height: 500,
            width: 500,
            decoration: BoxDecoration(
                border: Border.all(
                  color: maincolor,
                  width: 2.0,
                  strokeAlign: 3.0
                ),
                borderRadius: BorderRadius.circular(25)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                     Expanded(
                        child: ElevatedButton(
                            onPressed: () async {
                              Jalali? picked = await showPersianDatePicker(
                                
                               textDirection: TextDirection.rtl,
                               initialEntryMode: PersianDatePickerEntryMode.calendarOnly,
                                initialDate: Jalali.now(),
                                context: context,
                                firstDate: Jalali(1357, 1),
                                lastDate: Jalali(1500, 1),
                                builder: (context, child) {

                                  return Theme(
                                      data: ThemeData(fontFamily: 'yekan'), child: child!);
                                },
                              );
                            
                              controller.firstDate=picked;
                              controller.update();
                            },
                            child: Text(controller.firstDate!=null ?"${controller.firstDate.year}/${controller.firstDate.month}/${controller.firstDate.day}":"از تاریخ",style: TextStyle(fontWeight: FontWeight.w700),))),
                    
                    SizedBox(
                      width: 15,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                   Expanded(
                        child: ElevatedButton(
                            onPressed: ()async {
                                Jalali? picked = await showPersianDatePicker(
                                
                               textDirection: TextDirection.rtl,
                               initialEntryMode: PersianDatePickerEntryMode.calendarOnly,
                                initialDate: Jalali.now(),
                                context: context,
                                firstDate: Jalali(1357, 1),
                                lastDate: Jalali(1500, 1),
                                builder: (context, child) {

                                  return Theme(
                                      data: ThemeData(fontFamily: 'yekan'), child: child!);
                                },
                              );
                              
                              controller.lastDate=picked;
                              controller.update();



                            }, child: Text(controller.lastDate!=null?"${controller.lastDate.year}/${controller.lastDate.month}/${controller.lastDate.day}":"تا تاریخ",style: TextStyle(fontWeight: FontWeight.w700),))),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Expanded(
                        child: ElevatedButton(
                            onPressed: ()async {
                             List res=await getCacilate(controller.firstDate,controller.lastDate);
                             controller.days=res[0];
                             controller.months=res[1];
                             controller.monthsDay=res[2];
                             controller.weeks=res[3];
                             controller.weeksday=res[4];
                             controller.year=res[5];
                             controller.update();
                            }, child: Text("ثبت",style: TextStyle(fontWeight: FontWeight.w700),))),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Visibility(
                  visible:controller.days!=0,
                 
                  child: Column(
                    children: [
                      displayWidget(data: "معادل ${controller.days} روز",),
                     SizedBox(
                    height: 15,
                  ), 
                  displayWidget(data: "معادل ${controller.months} ماه و ${controller.monthsDay} روز",),
                  SizedBox(
                    height: 15,
                  ),
                  displayWidget(data: "معادل ${controller.weeks} هفته و ${controller.weeksday} روز"),
                  SizedBox(
                    height: 15,
                  ),
                  displayWidget(data: "معادل ${controller.year} سال و ${controller.yearsMonth} ماه و ${controller.monthsDay} روز"),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
Spacer(),
Text("Made By ❤️ By Aref Mousavi",style: TextStyle(color: Colors.deepPurple,fontWeight: FontWeight.w500),)
               
              ],
            ),
          ),
        ),
      );
      },) 
    );
  }
   getCacilate(var date1,var date2){
      DateTime gDate1 = date1.toDateTime();
      DateTime gDate2 = date2.toDateTime();
       Duration diff = gDate2.difference(gDate1);

      // استخراج مقادیر روز، ساعت، دقیقه و ثانیه
      int days = diff.inDays;
      
  // محاسبه تعداد ماه‌ها و سال‌ها (به‌صورت شمسی)
      int years = days ~/ 365; // تقریباً
     int remainingDays = days % 365;
     int months = (remainingDays ~/ 30)+(years*12); // تقریباً
     int remainingmonth=remainingDays ~/ 30;
////////////////////////////////////
/// 
  int weeks = days ~/ 7;
  int remainingDaysWeek = days % 7;
  return [days,months,remainingDays,weeks,remainingDaysWeek,years,remainingmonth];
   }
   
}

class displayWidget extends StatelessWidget {
  late String data;
  displayWidget({required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.0),
      child: Text(
        data,
        style: TextStyle(
            color: Colors.deepPurple,
            fontWeight: FontWeight.w900,
            fontSize: 16),
      ),
      decoration: BoxDecoration(
          color: maincolor, borderRadius: BorderRadius.circular(10)),
    );
  }
}


 
 //version 1.0.0