import 'package:flutter_redux/flutter_redux.dart';
import 'package:lucacertificate/models/user.dart';
import 'package:lucacertificate/redux/actions.dart';
import 'package:lucacertificate/redux/app_state.dart';
import 'package:lucacertificate/services.dart';
import 'package:redux/redux.dart';
import 'package:shared_preferences/shared_preferences.dart';

void lucaMiddleware(
  Store<AppState> store,
  action,
  NextDispatcher next,
) async {
  if (action is LoginAction) {
    print("########2");
    final res = await Services.login("r0013332", "Kechaou");
    // check if user logged in successfully
    if (res['error'] != null) {
      print(res);
    } else {
      User userLogged = res['data'];
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString("userTokenBase64", userLogged.tokenBase64);
      await prefs.setString("rNumber", userLogged.tokenBase64);
      await prefs.setBool("isLogged", true);
      store.dispatch(
        UpdateIsLogged(true),
      );
    }
  }
  next(action);
}
