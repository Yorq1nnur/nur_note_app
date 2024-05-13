import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nur_note_app/bloc/notes/notes_bloc.dart';
import 'package:nur_note_app/data/repo/notes_repo.dart';
import 'package:nur_note_app/screens/app_routes.dart';
import 'package:nur_note_app/services/local_notification_service.dart';
import 'package:nur_note_app/utils/colors/app_colors.dart';

class App extends StatelessWidget {
  App({
    super.key,
  });

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(
    BuildContext context,
  ) {
    LocalNotificationService.localNotificationService.init(
      navigatorKey,
    );

    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (
            _,
          ) =>
              NotesRepo(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (
              context,
            ) =>
                NotesBloc(
              context.read<NotesRepo>(),
            ),
          ),
        ],
        child: ScreenUtilInit(
          designSize: const Size(
            390,
            844,
          ),
          builder: (
            context,
            child,
          ) {
            ScreenUtil.init(
              context,
            );
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                useMaterial3: false,
              ),
              home: child,
            );
          },
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              appBarTheme: const AppBarTheme(
                backgroundColor: AppColors.white,
              ),
              scaffoldBackgroundColor: AppColors.white,
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                backgroundColor: Colors.white,
              ),
            ),
            initialRoute: RouteNames.splashScreen,
            navigatorKey: navigatorKey,
            onGenerateRoute: AppRoutes.generateRoute,
          ),
        ),
      ),
    );

    // return ScreenUtilInit(
    //   designSize: const Size(
    //     390,
    //     844,
    //   ),
    //   builder: (
    //     context,
    //     child,
    //   ) {
    //     ScreenUtil.init(
    //       context,
    //     );
    //     return MaterialApp(
    //       debugShowCheckedModeBanner: false,
    //       theme: ThemeData(
    //         useMaterial3: false,
    //         scaffoldBackgroundColor: const Color(
    //           0xFFF9F8FD,
    //         ),
    //       ),
    //       home: child,
    //     );
    //   },
    //   child: MaterialApp(
    //     debugShowCheckedModeBanner: false,
    //     theme: ThemeData(
    //       appBarTheme: const AppBarTheme(
    //         backgroundColor: AppColors.white,
    //       ),
    //       scaffoldBackgroundColor: AppColors.white,
    //       bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    //         backgroundColor: Colors.white,
    //       ),
    //     ),
    //     initialRoute: RouteNames.splashScreen,
    //     navigatorKey: navigatorKey,
    //     onGenerateRoute: AppRoutes.generateRoute,
    //   ),
    // );
  }
}
