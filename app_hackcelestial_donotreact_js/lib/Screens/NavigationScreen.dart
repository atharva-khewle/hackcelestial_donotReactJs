import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hackcelestial/Screens/AttendedLecturesScreen.dart';
import 'package:hackcelestial/Screens/HomeScreen.dart';
import 'package:hackcelestial/Screens/PreAttendanceScreen.dart';
import 'package:hackcelestial/Screens/profileScreen.dart';



class NavigationScreen extends StatefulWidget{

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {

  List<Widget> pages = [
    HomeScreen(),
    AttendedLecturesScreen(),
    SizedBox(),
    SizedBox(),
    ProfileScreen(),
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<BottomNavigationBarItem> items = [
      BottomNavigationBarItem(icon: Icon(Icons.home_outlined),label: "Home",backgroundColor: Colors.blue,activeIcon: Icon(Icons.home_filled),),
      BottomNavigationBarItem(icon: Icon(Icons.mobile_friendly),label: "Attendance",backgroundColor: Colors.blue,),
      BottomNavigationBarItem(icon: Icon(Icons.circle,color: Colors.transparent,),label: "",backgroundColor: Colors.blue),
      BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home",backgroundColor: Colors.blue),
      BottomNavigationBarItem(icon: Icon(Icons.person_2_outlined),label: "Me",backgroundColor: Colors.blue,activeIcon: Icon(Icons.person_2),),
    ];
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey.shade300,
      onTap: (index){

        if(index == 2){}
        else {
          setState(() {
            currentIndex = index;
          });
        }
      },items: items,),
      body: pages[currentIndex],
      floatingActionButton: FloatingActionButton(child: Icon(Icons.power),onPressed: (){
        Get.to(()=> PreAttendanceScreen(),transition: Transition.downToUp);
      },backgroundColor: Colors.white,foregroundColor: Colors.blue,),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}