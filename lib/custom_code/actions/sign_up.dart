// Automatic FlutterFlow imports
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';

Future<void> signUp(registerEmail, registerPassword) async {
  Map<CognitoUserAttributeKey, String> userAttributes = {
    CognitoUserAttributeKey.email: registerEmail,
    CognitoUserAttributeKey.phoneNumber: registerPassword,
  };

  try {
    await Amplify.Auth.signUp(
        username: registerEmail,
        password: registerPassword,
        options: CognitoSignUpOptions(userAttributes: userAttributes));
  } on AuthException catch (error) {}
}
