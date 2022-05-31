import 'package:despesas_pessoais/controllers/global_controller.dart';
import 'package:despesas_pessoais/routes/app_routes.dart';
import 'package:despesas_pessoais/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void application() {
  runApp(
    const Application(),
  );
}

class Application extends StatefulWidget {
  const Application({Key? key}) : super(key: key);

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  // late final ChartController _chartController;
  // late final FormController _formController;
  late final GlobalController _globalController;

  @override
  void initState() {
    _globalController = GlobalController();
    // _chartController = ChartController();
    // _formController = FormController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<GlobalController>(
          create: (_) => _globalController,
        ),
        // ChangeNotifierProvider<FormController>(
        //   create: (_) => _formController,
        // ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        routes: AppRoutes.path,
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        home: const HomeView(),
      ),
    );
  }
}
