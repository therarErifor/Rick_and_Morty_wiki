import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:my_notes/src/routes/router.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      backgroundColor: Colors.grey.shade100,
      bottomNavigationBuilder: (_, tabsRouter) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 60),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              color: Colors.white),
          child: BottomNavigationBar(
            backgroundColor: Colors.white,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            elevation: 0,
            selectedItemColor: Colors.green,
            currentIndex: tabsRouter.activeIndex,
            onTap: tabsRouter.setActiveIndex,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.insert_drive_file_outlined, size: 30), label: ''),
              BottomNavigationBarItem(
                  icon: Icon(Icons.check_box_outlined, size: 30), label: ''),
            ],
          ),
        );
      },
      routes: [NotesRoute(), TasksRoute()],
    );
  }
}
