import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_copyd/shared/cubit/news_cubit.dart';
import 'package:news_copyd/shared/cubit/news_state.dart';

import '../shared/components/components/news_article.dart';
import '../shared/components/components/textFormField.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = NewsCubit.get(context);
        var list = cubit.search;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: DefaultTextFormField(
                  text: 'Search',
                  prefixIcon: Icons.search,
                  onChanged: (value) {
                    cubit.getSearchData(text: value);
                  }
                ),
              ),
              ConditionalBuilder(
                  condition: list.isNotEmpty,
                  builder: (context) => Expanded(
                    child: ListView.builder(
                        itemBuilder: (context, index) =>
                            NewsArticle(model: list[index]),
                        itemCount: list.length),
                  ),
                  fallback: (context) => const Center(
                          child: CircularProgressIndicator(
                        strokeAlign: 10.0,
                        color: Colors.blue,
                      )))
            ],
          ),
        );
      },
    );
  }
}
