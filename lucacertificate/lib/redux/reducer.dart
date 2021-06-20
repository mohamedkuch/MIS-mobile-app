import 'package:lucacertificate/redux/actions.dart';
import 'package:lucacertificate/redux/app_state.dart';

AppState updateUserTokenReducer(AppState currentState, dynamic action) {
  if (action is UpdateIsLogged) {
    return AppState(
        isLogged: action.updatedIsLogged, loggedUser: action.updatedLoggedUser);
  }
  return currentState;
}
