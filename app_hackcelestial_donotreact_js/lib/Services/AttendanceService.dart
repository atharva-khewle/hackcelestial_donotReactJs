import 'package:cloud_firestore/cloud_firestore.dart';

class AttendanceService{
  
  static CollectionReference studentCollection = FirebaseFirestore.instance.collection("Student");

  static markPresent(String barcodeResult)async{


    //Getting Attendance Information
    barcodeResult = barcodeResult.substring(7);
    List info = barcodeResult.split('.');
    String day = info[0];
    String subject = info[1];



    //Updating Firebase
    final get = await studentCollection.doc("Zeeshan").get();
    final Map data = get.exists ? get.data() as Map : {};
    print("Recieved Firebase Data as $data");
    final attendance = data['attendance'];
    print("Recieved Attendance Data as $attendance");
    final now = DateTime.now();
    String time = "${now.hour}:${now.minute}:${now.second}";
    String date = "${now.day}/${now.month}/${now.year}";
    if(!attendance.containsKey(date)) {
      attendance[date] = {};
    }
    attendance[date][subject] = time;
    print("Updated Attendance Data as $attendance");
    await studentCollection.doc("Zeeshan").update({
      "attendance":attendance
    });
  }

  String createAttendanceQr(String passCode){
    return "";
  }

}