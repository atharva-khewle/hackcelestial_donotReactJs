import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart' as slider;  // Alias the carousel_slider package

class HomeScreen extends StatelessWidget {
  final slider.CarouselController _controller = slider.CarouselController();  // Use the alias

  // List of image URLs related to college events
  final List<String> imageUrls = [
    'https://i.pinimg.com/originals/e1/c2/d0/e1c2d08481d6a8b2954078d3bb7d8ef4.jpg',
    'https://clipart-library.com/images/pT7dArLjc.jpg',
    'https://mir-s3-cdn-cf.behance.net/projects/404/0e21ee49322185.58b11a3e8095a.png', // Replace these with actual image URLs
  ];

  final List<String> departments = [
    'Computer Science',
    'Mechanical Engineering',
    'Electrical Engineering',
    'Civil Engineering',
    'Electronics & Communication',
    'Information Technology',
    'Biotechnology',
    'Chemical Engineering',
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 50,),
          Text("पढ-AI",style: TextStyle(fontSize: 25),),
          SizedBox(height: 10,),
          Container(
            height: 200,
            child: slider.CarouselSlider.builder(  // Use the alias for CarouselSlider
              itemCount: imageUrls.length,
              carouselController: _controller,  // Use the alias
              options: slider.CarouselOptions(  // Use the alias for CarouselOptions
                autoPlay: true,
                enlargeCenterPage: true,
                height: 200,
              ),
              itemBuilder: (context, index, realIndex) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: NetworkImage(imageUrls[index]),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ),

      Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),  // Disable scrolling inside the grid
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,  // Two columns of tiles
            childAspectRatio: 3 / 2,  // Aspect ratio for the tiles
            crossAxisSpacing: 10,  // Space between columns
            mainAxisSpacing: 10,  // Space between rows
          ),
          itemCount: departments.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                // You can handle a tap on the department tile here if needed
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue.shade300,  // Background color of the tile
                  borderRadius: BorderRadius.circular(10),  // Rounded corners
                ),
                child: Center(
                  child: Text(
                    departments[index],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),

        ],
      ),
    );
  }
}
