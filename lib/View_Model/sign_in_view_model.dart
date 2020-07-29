import 'package:flutter/material.dart';
import 'package:flutter_google_sign_in_demo/base/base_model.dart';


class SignInViewModel extends BaseModel{



  bool _userLoginAutoValidate=false;

  TextEditingController _passwordController=TextEditingController();

  TextEditingController _userIdController =TextEditingController();

  bool _passwordVisible=false;

  bool get passwordVisible => _passwordVisible;

  set passwordVisible(bool value) {
    _passwordVisible = value;
    notifyListeners();
  }

  TextEditingController get userIdController => _userIdController;

  set userIdController(TextEditingController value) {
    _userIdController = value;
    notifyListeners();
  }

  TextEditingController get passwordController => _passwordController;

  set passwordController(TextEditingController value) {
    _passwordController = value;
    notifyListeners();
  }

  bool get userLoginAutoValidate => _userLoginAutoValidate;
  set userLoginAutoValidate(bool value) {
    _userLoginAutoValidate = value;
    notifyListeners();
  }



  clearAllModels(){
    _userLoginAutoValidate=false;
    _passwordController=TextEditingController();
    _userIdController=TextEditingController();
    _passwordVisible=false;
  }
}