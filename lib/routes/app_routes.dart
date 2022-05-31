import 'package:despesas_pessoais/views/home_view.dart';
import 'package:flutter/cupertino.dart';

class AppRoutes {
  static Map<String, Widget Function(BuildContext)> path = {
    homeView: (_) => const HomeView(),
  };

  static const homeView = '/home-view';
}
