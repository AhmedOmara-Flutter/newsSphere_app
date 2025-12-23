import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_copyd/shared/cubit/bloc_observer.dart';
import 'package:news_copyd/shared/network/remote/dio_helper.dart';
import 'package:news_copyd/src/app_root.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const AppRoot());
  DioHelper.init();
}
k