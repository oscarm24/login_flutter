import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors:[
          Colors.blue,
          Colors.red,
        ]
        )),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: _page(),
        ),
    );
  }

  Widget _page(){
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _icon(),
              const SizedBox(height: 30,),
              _inputField('Username', usernameController),
              const SizedBox(height: 20,),
               _inputField('Password', passwordController, isPasword: true),
               const SizedBox(height: 20,),
               _loginBtn(),
               const SizedBox(height: 20,),
               _extraText(),
            ],
        ),
      ),
    );
  }

  Widget _icon(){
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 2),
        shape: BoxShape.circle
      ),
      child: const Icon(Icons.person, color: Colors.white, size: 120),
    );
  }

  Widget _inputField(String hintText, TextEditingController controller,{isPasword = false}){
    var border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(18),
      borderSide: const BorderSide (color: Colors.white)
      );

      return TextField(
        style: const TextStyle(color: Colors.white),
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.white),
          enabledBorder: border,
          focusedBorder: border,
        ),
        obscureText: isPasword,
      );
  }

  Widget _loginBtn(){
    return ElevatedButton(
      onPressed: (){
        debugPrint("Username: " + usernameController.text);
        debugPrint("Password: " + passwordController.text);
      }, 
      child: const SizedBox(
        width: double.infinity,
        child: Text(
          "Sing in",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20),
          ),
      ),
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        primary: Colors.white,
        onPrimary: Colors.blue,
        padding: const EdgeInsets.symmetric(vertical: 16)
      ),
    );
  }

  Widget _extraText(){
    return const Text("Olvidaste tu contrasenia?", textAlign: TextAlign.center,
    style: TextStyle(fontSize: 16, color: Colors.white),);
  }

}