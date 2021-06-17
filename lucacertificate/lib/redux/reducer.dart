import 'package:lucacertificate/redux/actions.dart';
import 'package:lucacertificate/redux/app_state.dart';

AppState updateUserTokenReducer(AppState currentState, dynamic action) {
  if (action is UpdateUserTokenBase64) {
    return AppState(userTokenBase64: action.updatedUserTokenBase64);
  }
  return currentState;
}
