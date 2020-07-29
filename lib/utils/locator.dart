
import 'package:flutter_google_sign_in_demo/View_Model/home_view_model.dart';
import 'package:flutter_google_sign_in_demo/View_Model/sign_in_view_model.dart';
import 'package:get_it/get_it.dart';


GetIt locator = GetIt.instance;

void setLocator(){

  locator.registerLazySingleton(() => SignInViewModel());
  locator.registerLazySingleton(() => HomeViewModel());










}