import 'package:bismi_chicken/main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Expanded(
      child: Container(
        color: Colors.grey.shade50,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.03, vertical: height * 0.02),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    sizedBox(height * 0.08, width),
                    Text('Recent Activity', style: largeTextStyle),
                    sizedBox(height * 0.03, 0.0),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Wrap(
                          spacing: width * 0.028, // Horizontal space between boxes
                          runSpacing: height * 0.02, // Vertical space between rows
                          children: [1, 2, 3, 4].map(
                            (farm) {
                              return Card(
                                elevation: 1,
                                child: CustomContainer(
                                  width: width * 0.17, // Set the width to 16% of the screen width
                                  height: height * 0.37, // Adjust height as needed
                                  color: Colors.white,
                                  padding: EdgeInsets.all(15.0),
                                  borderRadius: BorderRadius.circular(15),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: height * 0.01), // Add some top spacing
                                      Text(
                                        'Farm $farm', // Dynamic farm name
                                        style: GoogleFonts.montserrat(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text('')
                                    ],
                                  ),
                                ),
                              );
                            },
                          ).toList()),
                    ),
                    sizedBox(height * 0.03, 0.0),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Card(
                          elevation: 1,
                          child: CustomContainer(
                            height: height * 0.6,
                            width: width * 0.6,
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                sizedBox(height * 0.025, 0.0),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: width * 0.015),
                                  child: Text('Account System', style: mediumTextStyleBold),
                                ),
                                sizedBox(height * 0.01, 0.0),
                                divider,
                              ],
                            ),
                          ),
                        ),
                        sizedBox(0.0, width * 0.01),
                        ///////////////////////////// Revenue //////////////////////////////////////////
                        Expanded(
                          child: Column(
                            children: [
                              Card(
                                elevation: 1,
                                child: CustomContainer(
                                  height: height * 0.2,
                                  width: width,
                                  padding: EdgeInsets.symmetric(horizontal: width * 0.015, vertical: height * 0.02),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  child: Column(
                                    children: [
                                      Text('Revenue', style: mediumTextStyleBold),
                                    ],
                                  ),
                                ),
                              ),
                              sizedBox(height * 0.01, 0.0),
                              ///////////////////////////// Revenue //////////////////////////////////////////
                              Card(
                                elevation: 1,
                                child: CustomContainer(
                                  height: height * 0.2,
                                  width: width,
                                  padding: EdgeInsets.symmetric(horizontal: width * 0.015, vertical: height * 0.02),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  child: Column(
                                    children: [
                                      Text('Expanse', style: mediumTextStyleBold),
                                    ],
                                  ),
                                ),
                              ),
                              sizedBox(height * 0.01, 0.0),
                              ///////////////////////////// Revenue //////////////////////////////////////////
                              Card(
                                elevation: 1,
                                child: CustomContainer(
                                  height: height * 0.2,
                                  width: width,
                                  padding: EdgeInsets.symmetric(horizontal: width * 0.015, vertical: height * 0.02),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  child: Column(
                                    children: [
                                      Text('Profit', style: mediumTextStyleBold),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////
class Import extends StatelessWidget {
  const Import({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Expanded(
      child: CustomContainer(
        height: height,
        width: width,
        color: Colors.grey.shade50,
        child: Column(
          children: [],
        ),
      ),
    );
  }
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////
class Feed extends StatelessWidget {
  const Feed({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Expanded(
      child: CustomContainer(
        height: height,
        width: width,
        color: Colors.grey.shade50,
        child: Column(
          children: [],
        ),
      ),
    );
  }
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////
class Export extends StatelessWidget {
  const Export({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Expanded(
      child: CustomContainer(
        height: height,
        width: width,
        color: Colors.grey.shade50,
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
