import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            SizedBox(
              height: 70,
            ),
            Container(
              height: 100,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Circular Avatar Background
                  Positioned(
                    bottom: 0,
                    child: Container(
                      height: 50,
                      width: size.width,
                      decoration: BoxDecoration(
                        color: Colors.lightBlue, // Changed to light blue
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),

                  // Circular Avatar
                  Positioned(
                    top: 0,
                    child: CircleAvatar(
                      radius: size.width * 0.13,
                      backgroundImage: NetworkImage(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTxHAkRMSJtLcNzuUv1uXYfkJVV_nkSIZc62g&s",
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: size.width,
              decoration: BoxDecoration(
                color: Colors.lightBlue, // Changed to light blue
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(0), // No rounding on top left
                  topRight: Radius.circular(0), // No rounding on top right
                  bottomLeft: Radius.circular(10), // Rounded bottom left
                  bottomRight: Radius.circular(10), // Rounded bottom right
                ),
              ),
              child: Column(
                children: [
                  Text(
                    "Zeeshan",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    textColor: Colors.white,
                    titleTextStyle: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18),
                    title: Text("PRN Number"),
                    trailing: Text(
                      "1234567",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  ListTile(
                    textColor: Colors.white,
                    titleTextStyle: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18),
                    title: Text("Contact Number"),
                    trailing: Text("9867319667", style: TextStyle(fontSize: 18)),
                  ),
                  ListTile(
                    textColor: Colors.white,
                    titleTextStyle: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18),
                    title: Text("Roll Number"),
                    trailing: Text("2203147", style: TextStyle(fontSize: 18)),
                  ),
                  ListTile(
                    textColor: Colors.white,
                    titleTextStyle: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18),
                    title: Text("Branch/Year"),
                    trailing: Text("Comps/SE", style: TextStyle(fontSize: 18)),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Card(
              color: Colors.lightBlue, // Changed to light blue
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10), // Rounded corners
              ),
              child: Theme(
                data: Theme.of(context)
                    .copyWith(dividerColor: Colors.transparent),
                child: ExpansionTile(
                  collapsedIconColor: Colors.white,
                  iconColor: Colors.white,
                  title: Text(
                    "My Internships (2)",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://d8it4huxumps7.cloudfront.net/lambda-pdfs/opportunity-bannerImages/1712508458.png"),
                            fit: BoxFit.fill),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      height: 170,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: size.width * 0.75,
                      child: Text(
                        "Web Development Internship",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://d8it4huxumps7.cloudfront.net/lambda-pdfs/opportunity-bannerImages/1705668391.png"),
                            fit: BoxFit.fill),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      height: 170,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: size.width * 0.75,
                      child: Text(
                        "Data Analyst Internship",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(
              height: 10,
            ),

            Container(
              width: size.width * 0.85,
              child: Text(
                "Borrowed Books",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
              ),
            ),

            SizedBox(
              height: 10,
            ),
            Container(
              height: 270,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.lightBlue, // Changed to light blue
                borderRadius: BorderRadius.circular(10),
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      width: 160,
                      child: Card(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10), // Rounded corners
                        ),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              height: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10), // Rounded corners
                                image: DecorationImage(
                                  image: NetworkImage(
                                      "https://m.media-amazon.com/images/I/81T98V4fTML._AC_UF1000,1000_QL80_.jpg"),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Mathematics Sem 3 Book",
                                style: TextStyle(fontWeight: FontWeight.w700),
                              ),
                            ),
                            Text("2d 12h 15m"),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 10), // Added spacing between cards
                    Container(
                      width: 160,
                      child: Card(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10), // Rounded corners
                        ),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              height: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10), // Rounded corners
                                image: DecorationImage(
                                  image: NetworkImage(
                                      "https://www.schoolchamp.net/image/cache/catalog/college/bengg/computer/semv/tcs-sem-5-computer-engg-tech-neo-mumbai-university-924x1042.webp"),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "TCS Sem 5 Book",
                                style: TextStyle(fontWeight: FontWeight.w700),
                              ),
                            ),
                            Spacer(),
                            Text("3d 11h 29m"),
                            Spacer(),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 10), // Added spacing between cards
                    Container(
                      width: 160,
                      child: Card(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10), // Rounded corners
                        ),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              height: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10), // Rounded corners
                                image: DecorationImage(
                                  image: NetworkImage(
                                      "https://1.bp.blogspot.com/-6G_Sx3Qi28E/YCpyl4RKjMI/AAAAAAAAAMM/fe3uCWlv0ZM6-vr17UDqnMveukQcKfctgCNcBGAsYHQ/s320/Screenshot_390.png"),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Data Structures Sem 3 Book",
                                style: TextStyle(fontWeight: FontWeight.w700),
                              ),
                            ),
                            Text("3d 11h 29m"),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 10), // Added spacing between cards
                    Container(
                      width: 160,
                      child: Card(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10), // Rounded corners
                        ),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              height: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10), // Rounded corners
                                image: DecorationImage(
                                  image: NetworkImage(
                                      "https://images-na.ssl-images-amazon.com/images/I/81h5KhaK54L.jpg"),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Discrete Math Book",
                                style: TextStyle(fontWeight: FontWeight.w700),
                              ),
                            ),
                            Text("3d 11h 29m"),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 10), // Added spacing between cards
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
