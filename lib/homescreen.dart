import 'package:flutter/material.dart';
import 'package:formmd/controller.dart';
import 'package:get/get.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
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
                                      data: ThemeData.light(), child: child!);
                                },
                              );
                              Get.find<mainController>().firstDate=picked;
                            },
                            child: Text("از تاریخ"))),
                    
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
                                      data: ThemeData.light(), child: child!);
                                },
                              );
                              
                              Get.find<mainController>().lastDate=picked;



                            }, child: Text("تا تاریخ"))),
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
                            await  getCacilate(Get.find<mainController>().firstDate,Get.find<mainController>().lastDate);
                            }, child: Text("ثبت"))),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                displayWidget(),
                SizedBox(
                  height: 15,
                ),
                displayWidget(),
                SizedBox(
                  height: 15,
                ),
                displayWidget(),
                SizedBox(
                  height: 15,
                )
              ],
            ),
          ),
        ),
      ),
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
     int months = remainingDays ~/ 30; // تقریباً
////////////////////////////////////
/// 
  int weeks = days ~/ 7;
  int remainingDaysWeek = days % 7;
   }
}

class displayWidget extends StatelessWidget {
  const displayWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.0),
      child: Text(
        "معادل روز",
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


 