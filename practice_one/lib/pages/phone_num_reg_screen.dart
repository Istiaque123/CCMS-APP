import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:practice_one/opt_reg_screen.dart';

class PhoneNumRegScreen extends StatefulWidget {
  const PhoneNumRegScreen({super.key});

  @override
  State<PhoneNumRegScreen> createState() => _PhoneNumRegScreenState();
}

class _PhoneNumRegScreenState extends State<PhoneNumRegScreen> {
  final _formKey = GlobalKey<FormState>();

  final phoneTextEditorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: bodyWeiget(),
      ),
    );
  }

  Widget bodyWeiget() {
    return Container(
      padding: const EdgeInsets.all(12),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: SizedBox(
                width: 100,
                height: 100,
                child: Image.asset(
                  "assets/images/spalsh_logo.png",
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(
              height: 90,
            ),
            const SizedBox(
              width: 300,
              child: Text(
                'আপনার মোবাইল নাম্বার প্রদান করুন',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            SizedBox(
              width: 400,
              child: 
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "আপনার মোবাইল নাম্বার প্রদান করুন";
                  }
                  return null;
                },
                controller: phoneTextEditorController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintText: "মোবাইল নাম্বার লিখুন",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.black)),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.black),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 250,
            ),
            ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const OptRegScreen()));
                  }
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff15803D),
                    foregroundColor: Colors.white,
                    minimumSize: const Size(370, 0),
                    padding: const EdgeInsets.symmetric(vertical: 12)),
                child: const Text(
                  "এগিয়ে যান",
                  style: TextStyle(fontSize: 20),
                )),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  // OTP Code
  Widget otpPin(){
    return Pinput(
      length: 6,
      defaultPinTheme: _defaultPinTheme,
    );
  }

  final _defaultPinTheme = PinTheme(
    width: 56,
    height: 60,
    textStyle: const TextStyle(
      fontSize: 26,
      color: Colors.grey,
    ),
     decoration: BoxDecoration(
      color: Colors.grey.shade700,
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: Colors.transparent)
     )
  );
}
