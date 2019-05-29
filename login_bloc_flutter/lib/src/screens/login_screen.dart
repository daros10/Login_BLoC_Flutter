import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../blocs/bloc.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(50.0),
      child: Column(
        children: <Widget>[
          emailTextField(),
          passwordField(),
          SizedBox(
            height: 30.0,
          ),
          submitButton(),
        ],
      ),
    );
  }

  Widget emailTextField() {
    return StreamBuilder(
        stream: bloc.email,
        builder: (context, snapshot) {
          return TextField(
            onChanged: bloc.changeEmail,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                hintText: 'Enter your email',
                labelText: 'Email Address',
                errorText: snapshot.error),
          );
        });
  }

  Widget passwordField() {
    return StreamBuilder(
      stream: bloc.password,
      builder: (context, snapshot) {
        return TextField(
          //obscureText: true, // hide the text input
          onChanged: bloc.changePassword,
          decoration: InputDecoration(
              hintText: 'Enter your password',
              labelText: 'Password',
              errorText: snapshot.error),
        );
      },
    );
  }

  Widget submitButton() {
    return StreamBuilder(
      stream: bloc.submitValid,
      builder: (context, snapshot) {
        return RaisedButton(
          shape: StadiumBorder(),
          child: Text(
            'Log In',
            style: TextStyle(color: Colors.white),
          ),
          color: Colors.lightBlue,
          onPressed: snapshot.hasData ? bloc.submit : null,
        );
      },
    );
  }
}
