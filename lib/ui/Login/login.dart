
import 'package:flutter/material.dart';

import '../base/base.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: FilledButton(onPressed: (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>BaseScreen()));
    }, child: Text("Login")));
  }
}