import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'package:felix/src/providers/checkbox.dart';

class SignInView extends StatefulWidget {
  const SignInView(this._controller, {Key? key}) : super(key: key);
  final PageController _controller;

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ResponsiveRowColumn(
        layout: ResponsiveRowColumnType.COLUMN,
        columnCrossAxisAlignment: CrossAxisAlignment.start,
        columnSpacing: 22,
        children: [
          const ResponsiveRowColumnItem(
              child: SizedBox(
            height: 10,
          )),
          ResponsiveRowColumnItem(
              child: Text('Login',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.josefinSans(
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                  ))),
          ResponsiveRowColumnItem(
              rowFit: FlexFit.tight,
              child: Text('See your growth and get consulting support',
                  style: GoogleFonts.josefinSans(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ))),
          ResponsiveRowColumnItem(
              child: SizedBox(
                  height: 45,
                  child: ElevatedButton.icon(
                    icon: Image.asset(
                      'assets/icons/google-48.png',
                      width: 24,
                      height: 24,
                    ),
                    label: Text("Sign in with google",
                        style: GoogleFonts.josefinSans(
                          color: Colors.black,
                          fontWeight: FontWeight.w800,
                          fontSize: 16,
                        )),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        minimumSize: const Size(double.infinity, 54),
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(style: BorderStyle.solid),
                          borderRadius: BorderRadius.circular(45),
                        )),
                    onPressed: () {},
                  ))),
          ResponsiveRowColumnItem(
              child: Center(
                  child: Text('Sign in with google',
                      style: GoogleFonts.josefinSans(
                        color: Colors.black45,
                        fontWeight: FontWeight.w800,
                      )))),
          ResponsiveRowColumnItem(
              child: Form(
                  child: ResponsiveRowColumn(
            columnSpacing: 14,
            layout: ResponsiveRowColumnType.COLUMN,
            children: [
              ResponsiveRowColumnItem(
                  child: SizedBox(
                      height: 40,
                      child: TextFormField(
                          decoration: InputDecoration(
                              hintText: 'Email',
                              hintStyle: GoogleFonts.josefinSans(),
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(45),
                              ))))),
              ResponsiveRowColumnItem(
                  child: SizedBox(
                      height: 40,
                      child: TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: 'Password',
                            hintStyle: GoogleFonts.josefinSans(),
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 20),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(45)),
                          )))),
              ResponsiveRowColumnItem(
                  rowFlex: 1,
                  child: ResponsiveRowColumn(
                    layout: ResponsiveRowColumnType.ROW,
                    rowMainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ResponsiveRowColumnItem(
                        child: Consumer<CheckboxProvider>(
                            builder: (context, checkbox, child) {
                          return FormField(builder: (builder) {
                            return Checkbox(
                                value: checkbox.getValue,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(35)),
                                fillColor: MaterialStateProperty.all(
                                    const Color.fromRGBO(122, 150, 236, 1)),
                                checkColor: Colors.white,
                                onChanged: (value) {
                                  checkbox.toggle();
                                });
                          });
                        }),
                      ),
                      ResponsiveRowColumnItem(
                          child: Container(
                              margin: const EdgeInsets.only(left: 8.0),
                              child: Text("Remember me",
                                  style: GoogleFonts.josefinSans(
                                    fontWeight: FontWeight.w800,
                                    fontSize: 12,
                                  )))),
                      const ResponsiveRowColumnItem(
                        child: Spacer(),
                      ),
                      ResponsiveRowColumnItem(
                          child: Text("Restore password",
                              style: GoogleFonts.josefinSans(
                                color: const Color.fromRGBO(122, 150, 236, 1),
                                fontWeight: FontWeight.w800,
                                fontSize: 12,
                              ))),
                    ],
                  )),
              ResponsiveRowColumnItem(
                  child: SizedBox(
                      height: 45,
                      child: ElevatedButton(
                          onPressed: () {},
                          child: Text('Sign in',
                              style: GoogleFonts.josefinSans(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                              )),
                          style: ElevatedButton.styleFrom(
                              primary: const Color.fromRGBO(122, 150, 236, 1),
                              minimumSize: const Size(double.infinity, 54),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(45),
                              ))))),
            ],
          ))),
          ResponsiveRowColumnItem(
              child: ResponsiveRowColumn(
            layout: ResponsiveRowColumnType.ROW,
            rowMainAxisAlignment: MainAxisAlignment.start,
            children: [
              ResponsiveRowColumnItem(
                  child: Text("Not registered yet? ",
                      style: GoogleFonts.josefinSans(
                        fontWeight: FontWeight.w800,
                        fontSize: 12,
                      ))),
              ResponsiveRowColumnItem(
                  child: InkWell(
                      onTap: () {
                        widget._controller.previousPage(
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.easeOut,
                        );
                      },
                      child: Text("Create an account",
                          style: GoogleFonts.josefinSans(
                            color: const Color.fromRGBO(122, 150, 236, 1),
                            fontWeight: FontWeight.w800,
                            fontSize: 12,
                          ))))
            ],
          )),
        ],
      ),
    );
  }
}
