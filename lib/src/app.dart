import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'package:felix/src/settings/settings_controller.dart';
import 'package:felix/src/pages/illustration.dart';
import 'package:felix/src/pages/signin_view.dart';
import 'package:felix/src/pages/signup_view.dart';
import 'package:felix/src/provider/checkbox.dart';

class FelixApp extends StatelessWidget {
  const FelixApp({
    super.key,
    required this.settingsController,
  });

  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: settingsController,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          restorationScopeId: 'felix',
          debugShowCheckedModeBanner: false,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', 'US'),
          ],
          onGenerateTitle: (BuildContext context) =>
              AppLocalizations.of(context)!.appTitle,
          theme: ThemeData(),
          darkTheme: ThemeData.dark(),
          themeMode: settingsController.themeMode,
          onGenerateRoute: (RouteSettings routeSettings) {
            return MaterialPageRoute<void>(
              settings: routeSettings,
              builder: (BuildContext context) {
                switch (routeSettings.name) {
                  default:
                    return MultiProvider(
                      providers: [
                        ChangeNotifierProvider(
                            create: (_) => CheckboxNotifier()),
                      ],
                      child: MaterialApp(
                          debugShowCheckedModeBanner: false,
                          theme: ThemeData(
                              primaryColor:
                                  const Color.fromRGBO(122, 150, 236, 1)),
                          builder: (context, widget) {
                            return ResponsiveWrapper.builder(
                              ClampingScrollWrapper.builder(context, widget!),
                              defaultScale: true,
                              breakpoints: [
                                // mobile
                                const ResponsiveBreakpoint.resize(320),
                                const ResponsiveBreakpoint.autoScale(375),
                                const ResponsiveBreakpoint.resize(425,
                                    name: MOBILE),
                                // tablet
                                const ResponsiveBreakpoint.resize(500),
                                const ResponsiveBreakpoint.autoScale(592),
                                const ResponsiveBreakpoint.resize(600,
                                    name: TABLET),
                                const ResponsiveBreakpoint.resize(700,
                                    name: 'illustration'),
                                // desktop
                                const ResponsiveBreakpoint.resize(1024),
                                const ResponsiveBreakpoint.autoScale(1024,
                                    name: DESKTOP),
                                const ResponsiveBreakpoint.resize(1100),
                                const ResponsiveBreakpoint.resize(1200),
                                const ResponsiveBreakpoint.autoScale(1300),
                                const ResponsiveBreakpoint.autoScale(1440,
                                    name: '4k'),
                              ],
                            );
                          },
                          title: 'Felix UI',
                          home: const Scaffold(
                            body: SafeArea(child: MainPageView()),
                            backgroundColor: Colors.white,
                          )),
                    );
                }
              },
            );
          },
        );
      },
    );
  }
}

class MainPageView extends StatefulWidget {
  const MainPageView({Key? key}) : super(key: key);

  @override
  State<MainPageView> createState() => _MainPageViewState();
}

class _MainPageViewState extends State<MainPageView> {
  late PageController controller = PageController(
    initialPage: 0,
  );

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveRowColumn(
        layout: ResponsiveWrapper.of(context).isSmallerThan(TABLET)
            ? ResponsiveRowColumnType.COLUMN
            : ResponsiveRowColumnType.ROW,
        children: [
          ResponsiveRowColumnItem(
              rowFlex: ResponsiveWrapper.of(context).isLargerThan(DESKTOP)
                  ? 5
                  : ResponsiveWrapper.of(context).isSmallerThan(TABLET)
                      ? 0
                      : 4,
              rowFit: FlexFit.tight,
              child: const ResponsiveVisibility(
                child: Illustration(),
                visible: false,
                visibleWhen: [
                  Condition.largerThan(breakpoint: 600),
                ],
              )),
          ResponsiveRowColumnItem(
              rowFlex:
                  ResponsiveWrapper.of(context).isLargerThan(DESKTOP) ? 6 : 5,
              rowFit: FlexFit.tight,
              columnFit: FlexFit.tight,
              child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal:
                        ResponsiveWrapper.of(context).isLargerThan(DESKTOP)
                            ? 120
                            : 25,
                  ),
                  child: PageView(
                    controller: controller,
                    dragStartBehavior: DragStartBehavior.start,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      SignUpView(controller),
                      SignInView(controller),
                    ],
                  ))),
        ]);
  }
}
