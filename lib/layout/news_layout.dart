import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_copyd/shared/cubit/news_cubit.dart';
import 'package:news_copyd/shared/cubit/news_state.dart';

import '../modules/search.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'News App',
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>Search(),
                        ));
                  },
                  icon: const Icon(
                    Icons.search,
                    size: 30.0,
                  )),
              IconButton(
                  onPressed: () {
                    cubit.changeThemeMode();
                  },
                  icon: const Icon(
                    Icons.brightness_4_outlined,
                    size: 30.0,
                  )),
            ],
          ),
          bottomNavigationBar: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
            ),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              onTap: (value) {
                cubit.changeBottomNavBar(value);
              },
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.business), label: 'Business'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.sports), label: 'Sports'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.science), label: 'Science'),
              ],
            ),
          ),
          body: cubit.screans[cubit.currentIndex],
        );
      },
    );
  }
}
