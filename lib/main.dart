import 'package:bismi_chicken/chicks_import.dart';
import 'package:bismi_chicken/dashboard.dart';
import 'package:bismi_chicken/export.dart';
import 'package:bismi_chicken/feeding.dart';
import 'package:bismi_chicken/view_model.dart/dashboard_provider.dart';
import 'package:bismi_chicken/view_model.dart/import_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<DashProvider>(
            create: (context) => DashProvider()),
        ChangeNotifierProvider<ImportProvider>(
            create: (context) => ImportProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<Widget> pages = [
    DashBoard(),
    ChicksImport(),
    Feed(),
    Export(),
  ];

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final provider = Provider.of<DashProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        children: [
          CustomContainer(
            width: width * 0.15,
            height: height,
            color: Colors.blue.shade50,
            border: Border(right: BorderSide(color: Colors.grey.shade100)),
            child: Column(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomContainer(
                      height: height * 0.11,
                      width: width,
                      color: Colors.transparent,
                      child: Center(
                        child: Text(
                          'Bismi Super Chicken',
                          textAlign: TextAlign.center,
                          style: largeTextStyle,
                        ),
                      ),
                    ),
                    const Divider(color: Colors.white),
                    sizedBox(height * 0.03, width),
                    ListView.builder(
                      itemCount: 4,
                      shrinkWrap: true,
                      padding: EdgeInsets.symmetric(horizontal: width * 0.008),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(bottom: height * 0.005),
                          child: InkWell(
                            onTap: () {
                              provider.setNavigationIndex(index);
                            },
                            child: CustomContainer(
                              height: 50,
                              width: width,
                              color: Colors.blue.shade50,
                              borderRadius: BorderRadius.circular(10),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: width * 0.01),
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      radius: height * 0.02,
                                      backgroundColor: Colors.grey,
                                      // backgroundImage: const AssetImage('assets/chicken-feed.png'),
                                    ),
                                    sizedBox(0.0, width * 0.01),
                                    Text(
                                      index == 0
                                          ? "DashBoard"
                                          : index == 1
                                              ? "Import"
                                              : index == 2
                                                  ? "Feed"
                                                  : "Export",
                                      style: GoogleFonts.montserrat(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          Consumer<DashProvider>(
            builder: (context, person, child) => pages[person.navigationindex],
          ),
        ],
      ),
    );
  }
}

/////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////
class CustomContainer extends StatelessWidget {
  final double height;
  final double width;
  final Color color;
  final BorderRadius? borderRadius;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Widget child;
  final Border? border; // Added border parameter

  const CustomContainer({
    Key? key,
    required this.height,
    required this.width,
    required this.color,
    this.borderRadius,
    this.padding,
    this.margin,
    required this.child,
    this.border, // Include the border parameter
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: color,
        borderRadius: borderRadius,
        border: border, // Apply the border to BoxDecoration
      ),
      child: child,
    );
  }
}

final TextStyle largeTextStyle = GoogleFonts.montserrat(
  fontSize: 22,
  fontWeight: FontWeight.bold,
);

final TextStyle mediumTextStyle = GoogleFonts.montserrat(
  fontSize: 18,
  fontWeight: FontWeight.w500,
);

final TextStyle mediumTextStyleBold = GoogleFonts.montserrat(
  fontSize: 18,
  fontWeight: FontWeight.w600,
);

final TextStyle smallTextStyle = GoogleFonts.montserrat(
  fontSize: 14,
  fontWeight: FontWeight.normal,
);

Widget sizedBox(height, width) {
  return SizedBox(
    height: height,
    width: width,
  );
}

final divider = Divider(color: Colors.grey.shade300);
