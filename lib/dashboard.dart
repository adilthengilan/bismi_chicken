import 'package:bismi_chicken/main.dart';
import 'package:bismi_chicken/view_model.dart/dashboard_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DashBoard extends StatefulWidget {
  DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final provider = Provider.of<DashProvider>(context, listen: false);
    provider.loadColors();
    print(provider.colors);
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
                    SizedBox(
                      height: height * 0.42,
                      child: ListView.builder(
                        padding: EdgeInsets.all(0),
                        itemCount: provider.farms.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(left: width * 0.01),
                            child: CustomContainer(
                              width: width * 0.17,
                              height: height * 0.40,
                              color: Colors.white,
                              padding: const EdgeInsets.all(15.0),
                              borderRadius: BorderRadius.circular(15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: height * 0.01),
                                  Text(
                                    'Farm $index',
                                    style: GoogleFonts.montserrat(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(height: height * 0.06),
                                  Center(
                                    child: SizedBox(
                                      height: height * 0.15,
                                      width: width * 0.082,
                                      child: CircularProgressIndicator(
                                        strokeWidth: width * 0.01,
                                        backgroundColor: Colors.grey.shade100,
                                        valueColor: AlwaysStoppedAnimation<Color>(provider.colors[index]),
                                        value: 400 / 500,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: height * 0.06),
                                  Center(
                                    child: Text(
                                      '80 / 100 Chicken',
                                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
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
                              ///////////////////////////// Expanse //////////////////////////////////////////
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
