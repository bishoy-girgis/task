import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'Core/config/page_route_name.dart';
import 'Core/config/routes.dart';
import 'Core/config/theme.dart';
import 'Core/services/bloc_observer.dart';
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      navigatorKey: navigatorKey,
      initialRoute: PageRouteName.initial,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
