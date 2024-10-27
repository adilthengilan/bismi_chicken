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
                          child: Container(
                            width: width * 0.6,
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // sizedBox(height * 0.025, 0.0),
                                // Padding(
                                //   padding: EdgeInsets.symmetric(horizontal: width * 0.015),
                                //   child: Text('System', style: mediumTextStyleBold),
                                // ),
                                // sizedBox(height * 0.01, 0.0),
                                // divider,
                                Container(
                                  width: width,
                                  color: Colors.transparent,
                                  child: Row(
                                    children: [
                                      AccountSystemCard(
                                        heading: 'Import',
                                        firstBar: 'Today Imported',
                                        firstBarValue: 70,
                                        secondBar: 'Today Batch Count',
                                        secondBarValue: 35,
                                        thirdBar: 'Dead Chicks',
                                        thirdBarValue: 60,
                                        fourthBar: 'Ready for Sale',
                                        fourthBarValue: 80,
                                      ),
                                      AccountSystemCard(
                                        heading: 'Feed',
                                        firstBar: 'Today Imported',
                                        firstBarValue: 20,
                                        secondBar: 'Today Batch Count',
                                        secondBarValue: 15,
                                        thirdBar: 'Dead Chicks',
                                        thirdBarValue: 60,
                                        fourthBar: 'Ready for Sale',
                                        fourthBarValue: 30,
                                      ),
                                      AccountSystemCard(
                                        heading: 'Export',
                                        firstBar: 'Today Imported',
                                        firstBarValue: 50,
                                        secondBar: 'Today Batch Count',
                                        secondBarValue: 45,
                                        thirdBar: 'Dead Chicks',
                                        thirdBarValue: 20,
                                        fourthBar: 'Ready for Sale',
                                        fourthBarValue: 10,
                                      ),
                                    ],
                                  ),
                                ),
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
                                  color: Colors.deepPurpleAccent.shade100,
                                  borderRadius: BorderRadius.circular(15),
                                  child: Column(
                                    children: [
                                      sizedBox(height * 0.02, width),
                                      Text(
                                        'Revenue',
                                        style: GoogleFonts.montserrat(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.deepPurpleAccent.shade700,
                                          letterSpacing: 2,
                                        ),
                                      ),
                                      Spacer(),
                                      Text(
                                        '183.806K',
                                        style: GoogleFonts.montserrat(
                                          fontSize: 28,
                                          color: Color.fromARGB(255, 243, 223, 255),
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 2,
                                        ),
                                      ),
                                      sizedBox(height * 0.028, 0.0),
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
                                  color: Colors.purpleAccent.shade100,
                                  borderRadius: BorderRadius.circular(15),
                                  child: Column(
                                    children: [
                                      sizedBox(height * 0.02, width),
                                      Text(
                                        'Expanse',
                                        style: GoogleFonts.montserrat(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.purple.shade700,
                                          letterSpacing: 2,
                                        ),
                                      ),
                                      Spacer(),
                                      Text(
                                        '10.203K',
                                        style: GoogleFonts.montserrat(
                                          fontSize: 28,
                                          color: Color.fromARGB(255, 254, 223, 255),
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 2,
                                        ),
                                      ),
                                      sizedBox(height * 0.028, 0.0),
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
                                  color: Colors.lightBlueAccent.shade100,
                                  borderRadius: BorderRadius.circular(15),
                                  child: Column(
                                    children: [
                                      sizedBox(height * 0.02, width),
                                      Text(
                                        'Profit',
                                        style: GoogleFonts.montserrat(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.lightBlueAccent.shade700,
                                          letterSpacing: 2,
                                        ),
                                      ),
                                      Spacer(),
                                      Text(
                                        '88.403K',
                                        style: GoogleFonts.montserrat(
                                          fontSize: 28,
                                          color: Color.fromARGB(255, 223, 255, 255),
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 2,
                                        ),
                                      ),
                                      sizedBox(height * 0.028, 0.0),
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

class AccountSystemCard extends StatelessWidget {
  final String heading;
  final String firstBar;
  final double firstBarValue;
  final String secondBar;
  final double secondBarValue;
  final String thirdBar;
  final double thirdBarValue;
  final String fourthBar;
  final double fourthBarValue;
  const AccountSystemCard({
    super.key,
    required this.heading,
    required this.firstBar,
    required this.firstBarValue,
    required this.secondBar,
    required this.secondBarValue,
    required this.thirdBar,
    required this.thirdBarValue,
    required this.fourthBar,
    required this.fourthBarValue,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(heading, style: mediumTextStyleBold),
            divider,
            sizedBox(height * 0.02, width),
            Text(firstBar, style: smallTextStyleBold),
            Row(
              children: [
                SizedBox(
                  width: width * 0.137,
                  height: 8,
                  child: LinearProgressIndicator(
                    value: firstBarValue / 100,
                    color: Colors.grey.shade100,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                  ),
                ),
                sizedBox(0.0, width * 0.005),
                Text('$firstBarValue', style: smallTextStyleBold),
              ],
            ),
            sizedBox(height * 0.02, width),
            Text(secondBar, style: smallTextStyleBold),
            Row(
              children: [
                SizedBox(
                  width: width * 0.137,
                  height: 8,
                  child: LinearProgressIndicator(
                    value: secondBarValue / 100,
                    color: Colors.grey.shade100,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.yellowAccent),
                  ),
                ),
                sizedBox(0.0, width * 0.005),
                Text('$secondBarValue', style: smallTextStyleBold),
              ],
            ),
            sizedBox(height * 0.02, width),
            Text(thirdBar, style: smallTextStyleBold),
            Row(
              children: [
                SizedBox(
                  width: width * 0.137,
                  height: 8,
                  child: LinearProgressIndicator(
                    value: thirdBarValue / 100,
                    color: Colors.grey.shade100,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
                  ),
                ),
                sizedBox(0.0, width * 0.005),
                Text('$thirdBarValue', style: smallTextStyleBold),
              ],
            ),
            sizedBox(height * 0.02, width),
            Text(fourthBar, style: smallTextStyleBold),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: width * 0.137,
                  height: 8,
                  child: LinearProgressIndicator(
                    value: fourthBarValue / 100,
                    color: Colors.grey.shade100,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                  ),
                ),
                sizedBox(0.0, width * 0.005),
                Text('$fourthBarValue', style: smallTextStyleBold),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
