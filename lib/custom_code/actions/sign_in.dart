// Automatic FlutterFlow imports
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';

void signIn(loginEmail, loginPassword) async {
  // Sign out before in case a user is already signed in
  // If a user is already signed in - Amplify.Auth.signIn will throw an exception
  try {
    await Amplify.Auth.signOut();
  } on AuthException catch (e) {
    print(e);
  }

  try {
    await Amplify.Auth.signIn(username: loginEmail, password: loginPassword);
    //Navigator.pop(context, true);
  } on AuthException catch (e) {}
}
