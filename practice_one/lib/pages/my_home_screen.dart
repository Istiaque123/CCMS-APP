import 'package:flutter/material.dart';
import 'package:practice_one/pages/phone_num_reg_screen.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({super.key});

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
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

  Widget bodyWeiget(){
    return Container(
      padding: const EdgeInsets.all(12),
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
          const SizedBox(height: 150,),
          const Text(
            'জাতীয় ভোক্তা অধিকার সংরক্ষন অধিদপ্তর',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.w600,
              color: Colors.black
            ),
            ),
            const SizedBox(
              height: 150,
            ),
            ElevatedButton(
              onPressed: (){
                 Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => const PhoneNumRegScreen())
                );
              }, 
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff15803D),
                foregroundColor: Colors.white,
                 minimumSize: const Size(350, 0),
                 padding: const EdgeInsets.symmetric(vertical: 12)

              ),

              child: const Text(
                "রেজিস্ট্রেশন",
                style: TextStyle(
                  fontSize: 20
                ),
                )
              ),
              const SizedBox(height: 20,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 48,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 1,
                        
                      )
                    ),
                  ),
                   
                  const SizedBox(width: 15,),
                  const Text(
                    'অথবা',
                    style: TextStyle(
                      fontSize: 15
                    ),
                    ),
                  const SizedBox(width: 15,),
                   Container(
                    width: 48,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 1,
                        
                      )
                    ),
                  ),

                ],
              ),
              const SizedBox(height: 20,),
              const Text(
                'ইতঃমধ্যে রেজিস্ট্রেশন করেছেন?',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.black
                ),
              ),

              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: ElevatedButton(
                onPressed: (){
                 
                }, 
                style: ElevatedButton.styleFrom(
                  backgroundColor:  Colors.white,
                  foregroundColor: Colors.black,
                   minimumSize: const Size(350, 0),
                   padding: const EdgeInsets.symmetric(vertical: 12),
                   
                   side: const BorderSide(
                    width: 1,
                    color: Colors.black
                   )
                
                ),
                
                child: const Text(
                  "লগইন",
                  style: TextStyle(
                    fontSize: 20
                  ),
                  )
                ),
              ),

        ],
      ),
    );
  }
}