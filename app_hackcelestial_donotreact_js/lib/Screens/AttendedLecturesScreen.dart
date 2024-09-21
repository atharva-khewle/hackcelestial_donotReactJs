import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class AttendedLecturesScreen extends StatelessWidget {

  final attendanceData = [
    FlSpot(0, 1), // Present on day 0
    FlSpot(1, 0), // Absent on day 1
    FlSpot(2, 1), // Present on day 2
    FlSpot(3, 1), // Present on day 3
    FlSpot(4, 0), // Absent on day 4
    FlSpot(5, 1), // Present on day 5
    FlSpot(6, 1), // Present on day 6
    FlSpot(7, 0), // Absent on day 7
    FlSpot(8, 1), // Present on day 8
    FlSpot(9, 1), // Present on day 9
    FlSpot(10, 0), // Absent on day 10
    FlSpot(11, 1), // Present on day 11
    FlSpot(12, 1), // Present on day 12
    FlSpot(13, 0), // Absent on day 13
    FlSpot(14, 1), // Present on day 14
    FlSpot(15, 1), // Present on day 15
    FlSpot(16, 0), // Absent on day 16
    FlSpot(17, 1), // Present on day 17
    FlSpot(18, 1), // Present on day 18
    FlSpot(19, 0), // Absent on day 19
  ];

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Card(
              elevation: 5,
              child: Container(
                padding: EdgeInsets.all(8.0),
                height: size.height * 0.25,
                child: BarChart(
                  BarChartData(
                    backgroundColor: Colors.white,
                    barGroups: createLectureAttendanceData(),
                    titlesData: FlTitlesData(
                      leftTitles: AxisTitles(
                        axisNameWidget: Text("Lectures Attended")
                      ),
                      bottomTitles: AxisTitles(
                        axisNameWidget: Text('Day',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold)),
                        sideTitles: SideTitles(
                          showTitles: true,
                        ),
                      ),

                    ),
                    gridData: FlGridData(
                      show: true,
                      horizontalInterval: 50000,
                      verticalInterval: 1,
                      getDrawingHorizontalLine: (value) {
                        return FlLine(
                          color: Colors.grey.withOpacity(0.5),
                          strokeWidth: 1,
                        );
                      },
                    ),
                    borderData: FlBorderData(
                      show: true,
                      border: Border.all(
                          color: Colors.black.withOpacity(0.3), width: 1),
                    ),
                    maxY: 7,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: size.width*0.45,
                height: 200,
                child: Card(
                  elevation: 5,
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    child: PieChart(
                      createPieChartData(),
                    ),
                  ),
                ),
              ),
              Container(
                width: size.width*0.45,
                height: 200,
                child: Card(
                  elevation: 5,
                  child: Center(child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Text("17/53",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 37,color: Colors.yellow.shade800),),
                        Text("Lectures attended this month",textAlign: TextAlign.center,style: TextStyle(fontSize: 17),),
                      ],
                    ),
                  ),),
                ),
              ),
            ],
          ),
          StreamBuilder(stream: FirebaseFirestore.instance.collection("Student").doc("Zeeshan").snapshots(), builder: (context,snapshot){
            if(snapshot.connectionState == ConnectionState.waiting){
              return const Center(
                child: CircularProgressIndicator(color: Colors.purple,),
              );
            }
      
            final Map data = snapshot.data!.data()!['attendance'];
            return ListView.builder(shrinkWrap: true,physics: NeverScrollableScrollPhysics(),itemCount: data!.length,itemBuilder: (context,index){
              final Map subjects = data.values.elementAt(index);
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(width: size.width*0.9,child: Text(data.keys.elementAt(index))),
                  ListView.builder(shrinkWrap: true,physics: NeverScrollableScrollPhysics(),itemCount: subjects.length,itemBuilder: (context,index2){
                    final String subject = subjects.keys.elementAt(index2);
                    String markedAt = subjects.values.elementAt(index2);
                    return AttendanceCard(subjectName: subject, markedAt: markedAt,);
                  }),
                ],
              );
            });
          }),
        ],
      ),
    );
  }


  List<BarChartGroupData> createLectureAttendanceData() {
    final data = List<BarChartGroupData>.generate(
      9, // Adjust this number to create more data points (up to 31)
          (index) => BarChartGroupData(
        x: index + 1, // Days of the month (1 to 20, or adjust for more days)
        barRods: [
          BarChartRodData(
            toY: getRandomLectureCount().toDouble(), // Randomly generate lecture count (0-7)
            width: 17,
            color: getRandomLectureColor(), // Randomly assign color
            borderRadius: BorderRadius.circular(4),
          ),
        ],
      ),
    );
    return data;
  }

  int getRandomLectureCount() {
    return Random().nextInt(8); // Generates a random number between 0 and 7
  }

  Color getRandomLectureColor() {
    final colors = [
      Colors.blue,
      Colors.lightBlue,
      Colors.green,
      Colors.lightGreen,
      Colors.orange,
      Colors.yellow,
      Colors.purple,
    ];
    return colors[Random().nextInt(colors.length)]; // Choose random color
  }

  PieChartData createPieChartData() {
    final data = [
      PieChartSectionData(
        value: 3, // Adjust value based on your data
        color: Colors.blue,
        title: 'TCS',
        radius: 70,
      ),
      PieChartSectionData(
        value: 4, // Adjust value based on your data
        color: Colors.lightBlue,
        title: 'DWM',
        radius: 70,
      ),
      PieChartSectionData(
        value: 2, // Adjust value based on your data
        color: Colors.green,
        title: 'SE',
        radius: 70,
      ),
      PieChartSectionData(
        value: 2, // Adjust value based on your data
        color: Colors.yellow,
        title: 'PCE',
        radius: 70,
      ),
      PieChartSectionData(
        value: 3, // Adjust value based on your data
        color: Colors.red,
        title: 'CN',
        radius: 70,
      ),
    ];

    return PieChartData(
      centerSpaceRadius: 0,
      startDegreeOffset: 10, // Offset the starting angle by 10 degrees
      sections: data,
    );
  }
}

class AttendanceCard extends StatelessWidget {

  final String subjectName;
  final String markedAt;
  AttendanceCard({required this.subjectName, required this.markedAt});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Card(
        elevation: 5,
        child: ListTile(
          leading: Icon(Icons.subject),
          title: Text(subjectName),
          subtitle: Text("Marked at $markedAt"),
        ),
      ),
    );
  }

}
