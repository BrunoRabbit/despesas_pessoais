import 'package:despesas_pessoais/controller/form_controller.dart';
import 'package:despesas_pessoais/routes/app_routes.dart';
import 'package:despesas_pessoais/view/home_view.dart';
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
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<FormController>(
          create: (_) => FormController(),
        ),
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
