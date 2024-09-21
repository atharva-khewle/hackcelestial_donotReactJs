import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hackcelestial/Controller/NearController.dart';
import 'package:lottie/lottie.dart';

import '../Services/AttendanceService.dart';
import '../Services/ImageService.dart';
import '../Services/LocalAuthService.dart';
import 'package:sensors_plus/sensors_plus.dart';


class PreAttendanceScreen extends StatefulWidget {

  @override
  State<PreAttendanceScreen> createState() => _PreAttendanceScreenState();
}

class _PreAttendanceScreenState extends State<PreAttendanceScreen> {

  late StreamSubscription<AccelerometerEvent> _streamSubscription;
  double _accelerationThreshold = 450.0;

  final nearController = Get.put(NearController(),);

  @override
  void initState() {
    super.initState();

    //Adding AccelerometerEvents Stream Listener
    _streamSubscription = accelerometerEvents.listen((event) {
      final acceleration =
          event.x * event.x + event.y * event.y + event.z * event.z;
      if (acceleration > _accelerationThreshold) {
        nearController.isNear.value = !nearController.isNear.value;
      }
    });
  }


  bool attendanceDone = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: ()async{

        bool isAuthenticated = await LocalAuthService.authenticateLocalAuth("Authenticate for Attendance");
        if(isAuthenticated) {
          String barcodeResult = await ImageService.getImageFromCamera();
          if(nearController.isNear.value) {
            await AttendanceService.markPresent(barcodeResult);
            setState(() {
              attendanceDone = true;
            });
            await Future.delayed(Duration(seconds: 5));
            Get.back();
          }
        }

      },child: Icon(Icons.qr_code,),backgroundColor: Colors.green,foregroundColor: Colors.white,),
      appBar: AppBar(
        title: Text("Mark Attendance"),
      ),
      body: attendanceDone ? Center(
        child: Container(
          width: size.width*0.9,
          height: size.height*0.4,
          child: Lottie.asset('assets/lotties/attendancedone.json'),
        ),
      ) : Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(
          ()=> Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Card(
              color: nearController.isNear.value ? Colors.green : Colors.red,
              child: ListTile(
                leading: nearController.isNear.value ? Icon(Icons.check,color: Colors.white,) : Icon(Icons.dangerous,color: Colors.white,),
                title: Text(nearController.isNear.value ? "Device Near" : "Device not near",style: TextStyle(color: Colors.white),),
                ),
            ),
          ),
          ),
          Container(
            width: size.width,
            height: size.height*0.5,
            child: Lottie.asset('assets/lotties/qrlottie.json',fit: BoxFit.fill),
          ),
          Text("Scan Qr to mark Attendance",style: TextStyle(fontWeight: FontWeight.w700),)

        ],
      ),

    );
  }
}
