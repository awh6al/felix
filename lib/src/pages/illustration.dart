import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';

class Illustration extends StatelessWidget {
  const Illustration({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ResponsiveRowColumn(
        layout: ResponsiveRowColumnType.COLUMN,
        columnMainAxisAlignment: MainAxisAlignment.center,
        columnCrossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ResponsiveRowColumnItem(
              child: Image.asset(
            'assets/images/db377fdecba203a67c147393ea755777.jpg',
          )),
          ResponsiveRowColumnItem(
              child: Text('Turns your ideas into reality',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.josefinSans(
                    color: Colors.black87,
                    fontSize: ResponsiveWrapper.of(context).isLargerThan(TABLET)
                        ? 29
                        : 18,
                    fontWeight: FontWeight.w700,
                  ))),
          ResponsiveRowColumnItem(
              child: Container(
                  margin: const EdgeInsets.only(top: 16),
                  child: Text(
                      "Consistent quality and experiance across \nall platforms and devices",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.josefinSans(
                        fontSize:
                            ResponsiveWrapper.of(context).isLargerThan(DESKTOP)
                                ? 16
                                : 14,
                        fontWeight: FontWeight.w400,
                        height: 1.2,
                      )))),
          const ResponsiveRowColumnItem(
              child: SizedBox(
            height: 15,
          )),
        ],
      ),
    );
  }
}
