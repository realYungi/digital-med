import 'package:flutter/material.dart';
import 'emailverificationscreen.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Sign Up text
            const Text(
              "Sign Up",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),
            // Name, Email, and Password input fields
            Column(
              children: [
                buildTextInputField("Name"),
                const SizedBox(height: 10),
                buildTextInputField("Email"),
                const SizedBox(height: 10),
                buildTextInputField("Password"),
              ],
            ),
            const SizedBox(height: 20),
            // Sign Up button
            Container(
              width: 300,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                  child: InkWell(
                onTap: () {
                  // Navigate to EmailVerificationScreen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const EmailVerificationScreen()),
                  );
                },
                child: Container(
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              )),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextInputField(String hintText) {
    return Container(
      width: 300,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
        ),
      ),
    );
  }
}
