import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_copyd/shared/cubit/news_cubit.dart';
import 'package:news_copyd/shared/cubit/news_state.dart';
import '../shared/components/components/news_article.dart';

class Business extends StatelessWidget {
  const Business({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = NewsCubit.get(context);
        var list = cubit.business;
        return ConditionalBuilder(
            condition: state is! AppGetBusinessLoadingState,
            builder: (context) => ListView.builder(
                itemBuilder: (context, index) =>
                    NewsArticle(model: list[index]),
                itemCount: list.length),
            fallback: (context) => const Center(
                    child: CircularProgressIndicator(
                  strokeAlign: 10.0,
                      color: Colors.blue,
                )));
      },
    );
  }
}
