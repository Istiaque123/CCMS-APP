import 'package:flutter/material.dart';

class NormalBtn extends StatelessWidget {
  final VoidCallback? onPressed;
  final Color backgroundColor;
  final Color foregroundColor;
  final Color borderColor;
  final bool borderSide;
  final String btnName;
  final Size minimumSize;
  final EdgeInsetsGeometry padding;

  const NormalBtn({
    super.key,
    required this.btnName,
    required this.backgroundColor ,
    required this.foregroundColor ,
    required this.borderSide ,
    required this.onPressed,
    this.borderColor = Colors.black,
    this.minimumSize = const Size(370, 0),
    this.padding = const EdgeInsets.symmetric(vertical: 12),
  }) ;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        minimumSize: minimumSize,
        padding: padding,
        side: borderSide
            ?  BorderSide(
                width: 1,
                color: borderColor,
              )
            : null,
      ),
      child: Text(
        btnName,
        style: const TextStyle(fontSize: 20),
      ),
    );
  }
}


class CustomBtn extends StatelessWidget {
  final VoidCallback onPressed;
  final String btnName;
  final Color backgroundColor;
  final Color foregroundColor;
  final double elevation;
  final Size minimumSize;
  final Color shadowColor;
  final bool borderSide;
  final EdgeInsetsGeometry padding;


  const CustomBtn({
    super.key,
    required this.btnName,
    required this.onPressed,
    this.borderSide = false,
    this.backgroundColor = Colors.white,
    this.foregroundColor = Colors.black,
    this.elevation = 10.0,
    this.minimumSize = const Size(double.infinity, 50), 
    this.shadowColor = const Color(0xFF000000), 
    this.padding = const EdgeInsets.symmetric(vertical: 15),


  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: padding, // Vertical padding
        minimumSize: minimumSize, // Configurable minimum size
        backgroundColor: backgroundColor, // Button background color
        foregroundColor: foregroundColor, // Text/icon color
        elevation: elevation, // Button elevation
        shadowColor: shadowColor, // Shadow color with opacity
        side: borderSide
            ? const BorderSide(
                width: 1,
                color: Colors.black,
              )
            : null,
      
        
      ),
      child: Text(
        btnName,
        style: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 20,
          color: foregroundColor, // Use the foreground color for text
        ),
      ),
    );
  }
}