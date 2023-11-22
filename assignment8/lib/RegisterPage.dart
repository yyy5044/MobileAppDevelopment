import 'package:assignment8/SuccessRegister.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: RegisterForm(),
    );
  }
}

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _authentication = FirebaseAuth.instance;
  final _formkey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formkey,
        child: ListView(
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: 'Email'),
              onChanged: (value) {
                email = value;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Password'),
              onChanged: (value) {
                password = value;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () async {
                  try {
                    final newUser =
                        await _authentication.createUserWithEmailAndPassword(
                        email: email, password: password);
                    if (newUser.user != null) {
                      _formkey.currentState!.reset();
                      if (!mounted) return;
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (
                                  context) => const SuccessRegisterPage()));
                    }
                  } catch (error) {
                    print(error);
                  }
                },
                child: const Text('Enter')),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('If you already registered, '),
                TextButton(
                  child: Text('log in with your email'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
