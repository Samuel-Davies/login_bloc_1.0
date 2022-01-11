import 'dart:async';
import 'validatorsMixin.dart';
import 'package:rxdart/rxdart.dart';

class Bloc extends Object with ValidatorMixin {
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  // to add or change value to stream
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  // to get  value from stream
  Stream<String> get email => _emailController.stream.transform(validateEmail);
  Stream<String> get password =>
      _passwordController.stream.transform(validatePassword);
  Stream<bool> get submitValid =>
      Rx.combineLatest2(email, password, (e, p) => true);

  submit() {
    // accessing input date from form
    final validEmail = _emailController.value;
    final validPassword = _passwordController.value;

    print('Email is $validEmail');
    print('Password is $validPassword');
  }

  dispose() {
    //cleanup of different objects or variables created

    _emailController.close();
    _passwordController.close();
  }
}

//creating an instance of the bloc class below

//final bloc = Bloc();
