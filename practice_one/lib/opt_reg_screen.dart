import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class OptRegScreen extends StatefulWidget {
  const OptRegScreen({super.key});

  @override
  State<OptRegScreen> createState() => OptRegScreenState();
}

class OptRegScreenState extends State<OptRegScreen> {
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
                'OTP প্রদান করুন',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
            ),
            const SizedBox(
              height: 80,
            ),
            SizedBox(
              width: 400,
              child: otpPin()
              ),
            const SizedBox(
              height: 250,
            ),
            button("OTP নিশ্চিত করুন", const Color(0xff15803D) , Colors.white, false, (){}),
            const SizedBox(
              height: 20,
            ),
            button("পুনরায় OTP পাঠান", Colors.white, Colors.black, true, (){})
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
      keyboardType: TextInputType.number,
    );
  }

// OTP section theme
  final _defaultPinTheme = PinTheme(
    width: 56,
    height: 60,
    textStyle: const TextStyle(
      fontSize: 26,
      color: Colors.grey,
    ),
    
     decoration: BoxDecoration(
      
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: Colors.black)
     )
  );

// Button set
  Widget button(String btnName, var backgroundColor, var foregroundColor, bool borderSide, var onPressed){
    return ElevatedButton(
                onPressed: onPressed,
                /* () {
                  if (_formKey.currentState?.validate() ?? false) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const OptRegScreen()));
                  }
                },
                */
                style: ElevatedButton.styleFrom(
                    backgroundColor: backgroundColor,
                    foregroundColor: foregroundColor,
                    minimumSize: const Size(370, 0),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    side: borderSide ? const BorderSide(
                    width: 1,
                    color: Colors.black
                   ) : null
                    ),
                    
                child:  Text(
                  btnName,
                  style: const TextStyle(fontSize: 20),
                )
                );
  }
}
