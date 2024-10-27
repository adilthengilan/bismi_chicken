import 'package:bismi_chicken/dashboard.dart';
import 'package:bismi_chicken/view_model.dart/dashboard_provider.dart';
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
        ChangeNotifierProvider<DashProvider>(create: (context) => DashProvider()),
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
  // final List<Widget> pages = [
  //   DashBoard(),
  //   const Import(),
  //   const Feed(),
  //   const Export(),
  // ];

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final provider = Provider.of<DashProvider>(context, listen: false);
    return Scaffold(
      body: Row(
        children: [
          CustomContainer(
            width: width * 0.15,
            height: height,
            color: Colors.white,
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Bismi',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.roboto(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.redAccent,
                              letterSpacing: 0.5,
                            ),
                          ),
                          Text(
                            'Super Chicken',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.roboto(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.blueAccent,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ],
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
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: width * 0.01),
                                child: Row(
                                  children: [
                                    CustomContainer(
                                        height: height * 0.04,
                                        width: width * 0.02,
                                        borderRadius: BorderRadius.circular(10),
                                        color: index == 0
                                            ? Colors.deepPurpleAccent
                                            : index == 2
                                                ? Colors.brown
                                                : index == 1
                                                    ? Colors.yellow
                                                    : index == 3
                                                        ? Colors.greenAccent.shade700
                                                        : Colors.transparent,
                                        image: index == 2
                                            ? DecorationImage(
                                                image: AssetImage('assets/chicken-feed.png'),
                                                fit: BoxFit.fill,
                                              )
                                            : null,
                                        child: Icon(
                                          index == 0
                                              ? Icons.home_outlined
                                              : index == 1
                                                  ? Icons.arrow_downward
                                                  : index == 3
                                                      ? Icons.arrow_upward
                                                      : null,
                                          color: Colors.white,
                                        )),
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
          DashBoard(),
          // Consumer<DashProvider>(
          //   builder: (context, person, child) => pages[person.navigationindex],
          // ),
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
  final double? width;
  final Color color;
  final BorderRadius? borderRadius;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Widget? child;
  final Border? border;
  final BoxShape shape;
  final DecorationImage? image;

  const CustomContainer({
    Key? key,
    required this.height,
    this.width,
    required this.color,
    this.borderRadius,
    this.padding,
    this.margin,
    this.child,
    this.border,
    this.shape = BoxShape.rectangle,
    this.image,
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
        borderRadius: shape == BoxShape.rectangle ? borderRadius : null, // Only use borderRadius if shape is rectangle
        border: border,
        shape: shape,
        image: image,
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

final TextStyle smallTextStyleBold = GoogleFonts.montserrat(
  fontSize: 16,
  fontWeight: FontWeight.w500,
);

Widget sizedBox(height, width) {
  return SizedBox(
    height: height,
    width: width,
  );
}

final divider = Divider(color: Colors.grey.shade300);
