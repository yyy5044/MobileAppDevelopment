import 'SuccessRegister.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

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
  bool saving = false;
  final _authentication = FirebaseAuth.instance;
  final _formkey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String userName = '';
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: saving,
      child: Padding(
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
                obscureText: true,
                decoration: const InputDecoration(labelText: 'Password'),
                onChanged: (value) {
                  password = value;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'User Name'),
                onChanged: (value) {
                  userName = value;
                },
              ),
              const SizedBox(
                height: 20,
              ),

              ElevatedButton(
                  onPressed: () async {
                    setState(() {
                      saving = true;
                    });
                    try {
                      final newUser =
                          await _authentication.createUserWithEmailAndPassword(
                          email: email, password: password);
                      await FirebaseFirestore.instance.collection('user').doc(newUser.user!.uid).set({
                        'userName': userName,
                        'email': email,
                      });
                      if (newUser.user != null) {
                        _formkey.currentState!.reset();
                        if (!mounted) return;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (
                                    context) => const SuccessRegisterPage()));
                      }
                      setState(() {
                        saving = false;
                      });
                    } catch (error) {
                      print(error);
                      setState(() {
                        saving = false;
                      });
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
      ),
    );
  }
}
