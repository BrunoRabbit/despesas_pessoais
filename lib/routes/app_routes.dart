import 'package:despesas_pessoais/views/form_view.dart';
import 'package:despesas_pessoais/views/home_view.dart';
import 'package:flutter/cupertino.dart';

class AppRoutes {
  static Map<String, Widget Function(BuildContext)> path = {
    homeView: (_) => const HomeView(),
    formView: (_) => const FormView(),
  };

  static const homeView = '/home-view';
  static const formView = '/form-view';
}
