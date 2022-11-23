// Automatic FlutterFlow imports
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';

Future<bool> confirmSignUp(confirmationCode) async {
  try {
    SignUpResult result = await Amplify.Auth.confirmSignUp(
        username: 'gsmreddy3@gmail.com', confirmationCode: confirmationCode);
    return result.isSignUpComplete;
    //Navigator.pop(context, true);
  } on AuthException catch (error) {
    return false;
  }
}
