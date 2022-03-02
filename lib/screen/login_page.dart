import 'package:flutter/material.dart';

import 'homepage.dart';
import 'sign_up_page.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController mailControler = TextEditingController();

  TextEditingController passwordControler = TextEditingController();

  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16),
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
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (contex) => Homepage()));
                  // print(mailControler.text);
                  // print(passwordControler.text);
                },
                child: Text(
                  'Log in',
                  style: TextStyle(color: Colors.white),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Dont have an account? '),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpPage()));
                    },
                    child: Text('Create account'))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
