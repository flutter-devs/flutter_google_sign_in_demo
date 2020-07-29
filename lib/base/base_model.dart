
import 'package:flutter/foundation.dart';
import 'package:flutter_google_sign_in_demo/utils/view_state.dart';

class BaseModel with ChangeNotifier {
  ViewState _state = ViewState.Idle;

  ViewState get state => _state;

  set state(ViewState viewState) {
    print('State:$viewState');
    _state = viewState;
    notifyListeners();
  }

  void update() {
    notifyListeners();
  }
}
