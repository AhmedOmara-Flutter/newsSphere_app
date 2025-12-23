import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_copyd/modules/business.dart';
import 'package:news_copyd/modules/science.dart';
import 'package:news_copyd/shared/network/remote/dio_helper.dart';
import '../../modules/sports.dart';
import 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());

  static NewsCubit get(context) => BlocProvider.of(context);
  List screans = [Business(), Sports(), Science()];

  //todo////////////////////////changeBottomNavBar//////////////////
  int currentIndex = 0;

  void changeBottomNavBar(int index) {
    currentIndex = index;
    emit(AppChangeBottomVavBarState());
  }

  //todo////////////////////////changeThemeMode//////////////////
  bool isDark = false;

  void changeThemeMode() {
    isDark = !isDark;
    emit(AppChangeThemeModeState());
  }

//todo////////////////////////getBusinessData//////////////////
  List<dynamic> business = [];

  void getBusinessData() {
    emit(AppGetBusinessLoadingState());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      "apiKey": "049c1660a02b492d8d3b37b503608683",
      "country": "us",
      "category": "business"
    }).then((value) {
      business = value.data['articles'];
      emit(AppGetBusinessSuccessState());
    }).catchError((error) {
      emit(AppGetBusinessErrorState(error: error));
    });
  }

//todo////////////////////////getBusinessData//////////////////
  List<dynamic> sports = [];

  void getSportsData() {
    emit(AppGetSportsLoadingState());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      "apiKey": "049c1660a02b492d8d3b37b503608683",
      "country": "us",
      "category": "sports"
    }).then((value) {
      sports = value.data['articles'];
      emit(AppGetSportsSuccessState());
    }).catchError((error) {
      emit(AppGetSportsErrorState(error: error));
    });
  }

  //todo////////////////////////getScienceData//////////////////
  List<dynamic> science = [];

  void getScienceData() {
    emit(AppGetScienceLoadingState());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      "apiKey": "049c1660a02b492d8d3b37b503608683",
      "country": "us",
      "category": "science"
    }).then((value) {
      science = value.data['articles'];
      emit(AppGetScienceSuccessState());
    }).catchError((error) {
      emit(AppGetScienceErrorState(error: error));
    });
  }

  //todo////////////////////////getSearchData//////////////////
  List<dynamic> search = [];

  void getSearchData({required String text}) {
    emit(AppGetSearchLoadingState());
    DioHelper.getData(url: 'v2/everything', query: {
      "apiKey": "049c1660a02b492d8d3b37b503608683",
      "q": text
    }).then((value) {
      search = value.data['articles'];
      emit(AppGetSearchSuccessState());
    }).catchError((error) {
      emit(AppGetSearchErrorState(error: error));
    });
  }
}
