import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:peludos_pet/app/domain/repositories/auth_repository.dart';
import 'package:peludos_pet/app/view/routes/routes.dart';
import 'package:peludos_pet/app/view/pages/home/widgets/header_widget.dart';
import 'package:peludos_pet/app/view/global_widget/navegation_bar_widget.dart';



class HomeScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldHomeKey = GlobalKey<ScaffoldState>();

  final List<Widget> bodyWidget;
   HomeScreen({super.key, required this.bodyWidget});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldHomeKey,
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              child: Text("Menú"),
            ),
            ListTile(
              title: const Text("Home"),
              onTap: () {
                router.pop(Routes.HOME);
              },
            ),
            ListTile(
              title: const Text("Record"),
              onTap: () {
                router.pop(context);
                router.pushNamed(Routes.RECORD);
              },
            ),
            ListTile(
              title: const Text("Result"),
              onTap: () {
                router.pop(context);
                router.pushNamed(Routes.RESULT);
              },
            ),
            ListTile(
              title: const Text("Result Document"),
              onTap: () {
                router.pop(context);
                router.pushNamed(Routes.RESULTPDF);
              },
            ),
            ListTile(
              title: const Text("form Medical History"),
              onTap: () {
                router.pop(context);
                router.pushNamed(Routes.RESULTPDF);
              },
            ),
            ListTile(
              title: const Text("Sing up"),
              onTap: () async {
                await Get.find<AuthRepository>().signOut();
                router.pushNamedAndRemoveUntil(Routes.WELCOME);
              },
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          ...bodyWidget,
          HeaderWidget(
            onMenuPressed: () {
              _scaffoldHomeKey.currentState?.openDrawer();
            },
          ),
        ],
      ),

      bottomNavigationBar: const NavigationBarWidget(),

    );
  }
}


