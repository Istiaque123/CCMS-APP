import 'package:flutter/material.dart';

// !---------------------------------------- Normal Button -----------------------------------------------

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
        style: const TextStyle(
          fontSize: 20,
          fontFamily: 'Kalpurush'
          ),
      ),
    );
  }
}

// !---------------------------------------- Custom Button -----------------------------------------------
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
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
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
            fontFamily: 'Kalpurush',
            color: foregroundColor, // Use the foreground color for text
          ),
        ),
      ),
    );
  }
}


// ! ---------------------------------------------Custom Squre Btn------------------------------------------------------------------

class CustomSqureBtn extends StatelessWidget {
  final String btnName;
  final VoidCallback onPressed;
  final bool borderSide;
  final Color backgroundColor;
  final Color foregroundColor;
  final double elevation;
  final Size minimumSize;
  final Color shadowColor;
  final Color borderColor;
  final double borderRadius;
  final EdgeInsetsGeometry padding;
  final Icon? icon; // Optional icon parameter

  const CustomSqureBtn({
    super.key,
    required this.btnName,
    required this.onPressed,
    this.borderSide = false,
    this.backgroundColor = Colors.white,
    this.foregroundColor = Colors.black,
    this.elevation = 10.0,
    this.minimumSize = const Size(double.infinity, 50),
    this.shadowColor = const Color(0xFF000000),
    this.borderColor = Colors.black,
    this.borderRadius = 10,
    this.padding = const EdgeInsets.symmetric(vertical: 15),
    this.icon, // Accept an optional icon
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: padding,
        minimumSize: minimumSize,
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        elevation: elevation,
        shadowColor: shadowColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        side: borderSide
            ? BorderSide(
                width: 1,
                color: borderColor,
              )
            : null,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min, // Ensures the button adjusts to content
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null) ...[
            icon!, // Display the icon if provided
            const SizedBox(width: 8), // Add spacing between icon and text
          ],
          Text(
            btnName,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 20,
              fontFamily: 'Kalpurush',
              color: foregroundColor,
            ),
          ),
        ],
      ),
    );
  }
}
