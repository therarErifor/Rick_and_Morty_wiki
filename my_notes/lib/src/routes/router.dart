import 'package:auto_route/auto_route.dart';

import '../presentation/home/home_screen.dart';
import '../presentation/notes/notes_page.dart';
import '../presentation/tasks/tasks_page.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: HomeRoute.page, path: '/', children: [
      AutoRoute(page: NotesRoute.page),
      AutoRoute(page: TasksRoute.page)
    ]),
  ];
}