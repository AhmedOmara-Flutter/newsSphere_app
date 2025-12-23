abstract class NewsState {}

class NewsInitial extends NewsState {}

class AppChangeBottomVavBarState extends NewsState {}

class AppChangeThemeModeState extends NewsState {}

//todo///////////////business///////////////////////////////////////
class AppGetBusinessLoadingState extends NewsState {}

class AppGetBusinessSuccessState extends NewsState {}

class AppGetBusinessErrorState extends NewsState {
  final String error;

  AppGetBusinessErrorState({required this.error});
}
//todo///////////////search///////////////////////////////////////

class AppGetSearchLoadingState extends NewsState {}

class AppGetSearchSuccessState extends NewsState {}

class AppGetSearchErrorState extends NewsState {
  final String error;

  AppGetSearchErrorState({required this.error});
}
//todo///////////////science///////////////////////////////////////

class AppGetScienceLoadingState extends NewsState {}

class AppGetScienceSuccessState extends NewsState {}

class AppGetScienceErrorState extends NewsState {
  final String error;

  AppGetScienceErrorState({required this.error});
}
//todo///////////////sports///////////////////////////////////////

class AppGetSportsLoadingState extends NewsState {}

class AppGetSportsSuccessState extends NewsState {}

class AppGetSportsErrorState extends NewsState {
  final String error;

  AppGetSportsErrorState({required this.error});
}
