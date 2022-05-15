import 'package:despesas_pessoais/view/form_view.dart';
import 'package:despesas_pessoais/view/home_view.dart';
import 'package:flutter/cupertino.dart';

class AppRoutes {
  static Map<String, Widget Function(BuildContext)> path = {
    RoutesPath.homePage: (_) => const HomeView(),
    RoutesPath.formPage: (_) => const FormView(),
  };
}

class RoutesPath {
  static const homePage = '/home-view';
  static const formPage = '/form-view';
}
