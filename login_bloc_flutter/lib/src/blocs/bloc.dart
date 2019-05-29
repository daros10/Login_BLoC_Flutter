import 'dart:async';
import 'validator.dart';
import 'package:rxdart/rxdart.dart';

class Bloc with Validator{
  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();

  //add data to stream
  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePassword => _password.sink.add;

  //retrieve data from stream
  Stream<String> get email => _email.stream.transform(validateEmail);
  Stream<String> get password => _password.stream.transform(validatePassword);

  //Strems with library RXDART
  Stream<bool> get submitValid  => Observable.combineLatest2(email, password, (email, password) => true);

  submit(){
    final validEmail = _email.value;
    final validPasword = _password.value;
    print('Your email is $validEmail and your password is $validPasword');
  }

  void dispose(){
    _email.close();
    _password.close();
  }

}

//single global instant -- exec when the app run the first time 
final bloc = Bloc();