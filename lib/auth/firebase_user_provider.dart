import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class ConverseFirebaseUser {
  ConverseFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

ConverseFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<ConverseFirebaseUser> converseFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<ConverseFirebaseUser>(
      (user) {
        currentUser = ConverseFirebaseUser(user);
        return currentUser!;
      },
    );
