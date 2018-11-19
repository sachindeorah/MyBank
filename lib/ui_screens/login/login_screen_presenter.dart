import 'package:mybank/data/ApiHelper.dart';
import 'package:mybank/model/user.dart';

abstract class LoginScreenContract {
  void onLoginSuccess(User user);
  void onLoginError(String errorTxt);
}

class LoginScreenPresenter {
  LoginScreenContract _view;
  ApiHelper api = new ApiHelper();
  LoginScreenPresenter(this._view);

  doLogin(String username, String password) {
    api.login(username, password)
        .then((User user) {
      _view.onLoginSuccess(user);})
        .catchError((Object error) =>
        _view.onLoginError(error.toString()));
  }
}