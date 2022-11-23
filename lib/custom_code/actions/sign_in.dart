// Automatic FlutterFlow imports

import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';

Future<bool> signIn(loginEmail, loginPassword) async {
  // Sign out before in case a user is already signed in
  // If a user is already signed in - Amplify.Auth.signIn will throw an exception
  try {
    await Amplify.Auth.signOut();
  } on AuthException catch (e) {
    print(e);
  }

  try {
    SignInResult result = await Amplify.Auth.signIn(
        username: loginEmail, password: loginPassword);
    return result.isSignedIn;

    //Navigator.pop(context, true);
  } on AuthException catch (e) {
    return false;
  }
}
