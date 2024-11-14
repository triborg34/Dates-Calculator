
// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:Dates.Calculator/controller.dart';
import 'package:get/get.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';
import 'dart:math';

class HomeScreen extends StatelessWidget {

  int tab=1;
 
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
                             List res=await getCalc(controller.lastDate.toDateTime(),controller.firstDate.toDateTime());
                             
                             controller.totaldays=res[0];
                             controller.years=res[1];
                             controller.months=res[2];
                             controller.days=res[3];
                             controller.totalMonths=res[4];
                             controller.weeks=res[5];
                             controller.remainingDays=res[6];
                             controller.update();
                             //[totalDays,years,months,days,totalMonths,weeks,remainingDays];
                             
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
                      displayWidget(data: "معادل ${controller.totaldays} روز",),
                     SizedBox(
                    height: 15,
                  ), 
                  displayWidget(data: "معادل ${controller.totalMonths} ماه و ${controller.days} روز",),
                  SizedBox(
                    height: 15,
                  ),
                  displayWidget(data: "معادل ${controller.weeks} هفته و ${controller.remainingDays} روز"),
                  SizedBox(
                    height: 15,
                  ),
                  displayWidget(data: "معادل ${controller.years} سال و ${controller.months} ماه و ${controller.days} روز"),
                    ],
           
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
Spacer(),
GestureDetector(onTap: () {
  
  if(tab==5){
   Get.snackbar("Its made By Aref Mousavi ", "My Friend Need Vacation So i named to him");
   tab=1;
  }else{tab++;}
},child: Text("Made By Mohamad Taheri",style: TextStyle(color: Colors.deepPurple,fontWeight: FontWeight.w500),))
               
              ],
            ),
          ),
        ),
      );
      },) 
    );
  }
   
}



getCalc(DateTime endDate,DateTime startDate){

  int totalDays = (endDate.difference(startDate).inDays)+1;

  // Calculate the number of years, months, and remaining days
  int years = endDate.year - startDate.year;
  int months = endDate.month - startDate.month;
  int days = endDate.day - startDate.day;

  // Adjust months and years if needed
  if (days < 0) {
    months -= 1;
    days += DateTime(endDate.year, endDate.month, 0).day;
  }
  if (months < 0) {
    years -= 1;
    months += 12;
  }

  // Calculate total months
  int totalMonths = years * 12 + months;

  // Calculate weeks and remaining days
  int weeks = totalDays ~/ 7;
  int remainingDays = totalDays % 7;

  // Print results
  print('It is $totalDays days from the start date to the end date, but not including the end date.');
  print('Or $years years, $months months, $days days excluding the end date.');
  print('Or $totalMonths months, $days days excluding the end date.');
  print('Or $weeks weeks and $remainingDays days.');
  return [totalDays,years,months,days,totalMonths,weeks,remainingDays];
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