import 'package:client/controllers/user.dart';
import 'package:flutter/material.dart';
import 'components/text_field.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUPState();
}

class _SignUPState extends State<SignUp> {
  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController campusController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    surnameController.dispose();
    campusController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Signup",
          style: _theme.textTheme.headline4?.copyWith(
              fontWeight: FontWeight.bold, color: const Color(0xFF244581)),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextField(
                controller: nameController,
                labelText: 'Name',
                obscureText: false,
              ),
              CustomTextField(
                controller: surnameController,
                labelText: 'Surname',
                obscureText: false,
              ),
              CustomTextField(
                controller: phoneController,
                labelText: 'Phone',
                obscureText: false,
              ),
              CustomTextField(
                controller: campusController,
                labelText: 'Campus',
                obscureText: false,
              ),
              CustomTextField(
                controller: emailController,
                labelText: 'Email',
                obscureText: false,
              ),
              CustomTextField(
                controller: passwordController,
                labelText: 'Password',
                obscureText: true,
              ),
              Center(
                child: SizedBox(
                    width: MediaQuery.of(context).size.width - 50,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: const Color(0xFF244581)),
                      child: const Text('SignUp'),
                      onPressed: () {
                        Future<int> response = UserController().signup(
                            name: nameController.text,
                            surname: surnameController.text,
                            phone: phoneController.text,
                            campus: campusController.text,
                            email: emailController.text,
                            password: passwordController.text);
                        response.then((value) {
                          if (value == 200) {
                            Navigator.pop(context);
                          }
                        });
                      },
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
