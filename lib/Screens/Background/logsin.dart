import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final String image; // Image path passed via constructor
  final double height;
  final double width;
  final Widget child;

  const Background({
    super.key,
    required this.image,
    this.height = .7,
    this.width = 400,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal, // Keeps horizontal scrolling
          child: Row(
            children: [
              // Dynamically change the image based on what is passed
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20), // Rounded top corners
                  topRight: Radius.circular(20),
                ),
                child: Image.asset(
                  "assets/$image", // Use the image from the constructor
                  width: size.width * 0.4, // Adjust image width
                  height: size.height * height,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                  width: 20), // Add space between image and container

              // Container with your form or other widgets
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 1,
                      spreadRadius: 0,
                      color: Colors.grey,
                    ),
                  ],
                ),
                width: width,
                height: size.height * height,
                child: child, // Holds the form or other widgets
              ),
            ],
          ),
        ),
      ),
    );
  }
}
