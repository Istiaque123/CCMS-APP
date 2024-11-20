import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:practice_one/feature/common/normal_btn.dart';

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
            
            NormalBtn(
            btnName: "OTP নিশ্চিত করুন", 
            backgroundColor: const Color(0xff15803D), 
            foregroundColor: Colors.white, 
            borderSide: false, 
            onPressed: (){}
            ),
            const SizedBox(
              height: 20,
            ),
            NormalBtn(
              btnName: "পুনরায় OTP পাঠান", 
              backgroundColor: Colors.white, 
              foregroundColor: Colors.black, 
              borderSide: true, 
              onPressed: (){}
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


}
