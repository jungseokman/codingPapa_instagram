import 'package:flutter/material.dart';
import 'package:instagram/constants/material_white.dart';
import 'package:instagram/router/route.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<TheRouter>(
          lazy: false,
          create: (context) => TheRouter(),
        ),
      ],
      child: Builder(builder: (context) {
        final router = Provider.of<TheRouter>(context).router;
        return MaterialApp.router(
          routeInformationProvider: router.routeInformationProvider,
          routeInformationParser: router.routeInformationParser,
          routerDelegate: router.routerDelegate,
          theme: ThemeData(primarySwatch: white),
        );
      }),
    );
  }
}
