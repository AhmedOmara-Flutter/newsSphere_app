import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_copyd/shared/cubit/news_cubit.dart';
import 'package:news_copyd/shared/cubit/news_state.dart';
import '../layout/news_layout.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => NewsCubit()
              ..getBusinessData()
              ..getScienceData()
              ..getSportsData()),
      ],
      child: BlocConsumer<NewsCubit, NewsState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit = NewsCubit.get(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                appBarTheme: const AppBarTheme(
                  titleTextStyle: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.white,
                    systemNavigationBarColor: Colors.white,
                    statusBarIconBrightness: Brightness.dark,
                  ),
                  iconTheme: IconThemeData(color: Colors.black),
                  color: Colors.white,
                  elevation: 0.0,
                ),
                scaffoldBackgroundColor: Colors.white,
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  backgroundColor: Colors.grey[500],
                  unselectedItemColor: Colors.black,
                  elevation: 0.0,
                  type: BottomNavigationBarType.fixed,
                ),
                textTheme: const TextTheme(
                    bodyLarge: TextStyle(
                        color: Colors.black,
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold))),
            darkTheme: ThemeData(
              appBarTheme: const AppBarTheme(
                titleTextStyle: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.black,
                  systemNavigationBarColor: Colors.black,
                  statusBarIconBrightness: Brightness.light,
                ),
                color: Colors.black,
                iconTheme: IconThemeData(color: Colors.white),
                elevation: 0.0,
              ),
              scaffoldBackgroundColor: Colors.black,
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                backgroundColor: Colors.white,
                unselectedItemColor: Colors.black,
                elevation: 0.0,
                type: BottomNavigationBarType.fixed,
              ),
              textTheme: const TextTheme(
                  bodyLarge: TextStyle(
                      color: Colors.white,
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold)),
            ),
            themeMode: cubit.isDark ? ThemeMode.dark : ThemeMode.light,
            home: const NewsLayout(),
          );
        },
      ),
    );
  }
}
