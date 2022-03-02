import 'package:flutter/material.dart';
import 'package:rna_furniture/screen/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController mailControler = TextEditingController();
  TextEditingController userControler = TextEditingController();
  TextEditingController phoneControler = TextEditingController();
  TextEditingController passwordControler = TextEditingController();

  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              height: 120,
              width: 120,
            ),
            const Padding(
              padding: EdgeInsets.all(18.0),
              child: Text(
                'User Login',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            TextField(
              onChanged: (value) {
                // print(value);
                setState(() {});
              },
              controller: userControler,
              decoration: InputDecoration(
                isDense: true,
                label: const Text('User'),
                prefixIcon: Icon(Icons.person),
                suffixIcon: userControler.text.isEmpty
                    ? null
                    : IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: () {
                          userControler.clear();
                          setState(() {});
                        },
                      ),
                hintText: 'User name',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(35)),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            TextField(
              onChanged: (value) {
                // print(value);
                setState(() {});
              },
              controller: phoneControler,
              decoration: InputDecoration(
                isDense: true,
                label: const Text('Phone'),
                prefixIcon: Icon(Icons.phone),
                suffixIcon: phoneControler.text.isEmpty
                    ? null
                    : IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: () {
                          phoneControler.clear();
                          setState(() {});
                        },
                      ),
                hintText: 'User phone',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(35)),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            TextField(
              onChanged: (value) {
                // print(value);
                setState(() {});
              },
              controller: mailControler,
              decoration: InputDecoration(
                isDense: true,
                label: const Text('Email'),
                prefixIcon: Icon(Icons.mail),
                suffixIcon: mailControler.text.isEmpty
                    ? null
                    : IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: () {
                          mailControler.clear();
                          setState(() {});
                        },
                      ),
                hintText: 'abc@mail.com',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(35)),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            TextField(
              obscureText: isVisible,
              controller: passwordControler,
              decoration: InputDecoration(
                isDense: true,
                label: const Text('Password'),
                prefixIcon: const Icon(Icons.lock),
                suffixIcon: GestureDetector(
                  onTap: () {
                    isVisible = !isVisible;
                    setState(() {});
                  },
                  child:
                      Icon(isVisible ? Icons.visibility : Icons.visibility_off),
                ),
                hintText: 'Enter your password',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(35)),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            MaterialButton(
                shape: StadiumBorder(),
                color: Colors.purple,
                minWidth: double.infinity,
                height: 40,
                onPressed: () async {
                  try {
                    UserCredential userCredential = await FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                            email: mailControler.text,
                            password: passwordControler.text);

                    var user = userCredential.user;
                    if (user != null) {
                      FirebaseFirestore firestore = FirebaseFirestore.instance;
                      firestore
                          .collection('users')
                          .doc(mailControler.text)
                          .set({
                        'name': userControler.text,
                        'phone': phoneControler.text,
                        'email': mailControler.text
                      });
                    }
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'weak-password') {
                      print('The password provided is too weak.');
                    } else if (e.code == 'email-already-in-use') {
                      print('The account already exists for that email.');
                    }
                  } catch (e) {
                    print(e);
                  }
                },
                child: const Text(
                  'Sign up',
                  style: TextStyle(color: Colors.white),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Already have an account? '),
                TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                    child: const Text('Sign in here'))
              ],
            )
          ],
        ),
      ),
    );
  }
}
