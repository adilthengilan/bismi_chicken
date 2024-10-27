import 'package:bismi_chicken/main.dart';
import 'package:flutter/material.dart';

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
