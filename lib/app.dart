import 'package:despesas_pessoais/controllers/global_controller.dart';
import 'package:despesas_pessoais/controllers/theme_controller.dart';
import 'package:despesas_pessoais/routes/app_routes.dart';
import 'package:despesas_pessoais/themes/my_theme.dart';
import 'package:despesas_pessoais/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';

void application() {
  initializeDateFormatting().then(
    (_) => runApp(
      const Application(),
    ),
  );
}

class Application extends StatefulWidget {
  const Application({Key? key}) : super(key: key);

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  late final ThemeController _themeController;
  late final GlobalController _globalController;

  @override
  void initState() {
    _globalController = GlobalController();
    _themeController = ThemeController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<GlobalController>(
          create: (_) => _globalController,
        ),
        ChangeNotifierProvider<ThemeController>(
          create: (_) => _themeController,
          builder: (context, _) {
            final themeProvider = Provider.of<ThemeController>(context);
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              routes: AppRoutes.path,
              themeMode: themeProvider.themeMode,
              theme: MyTheme.lightTheme,
              darkTheme: MyTheme.darkTheme,
              home: const HomeView(),
            );
          },
        ),
      ],
      // child:
    );
  }
}
