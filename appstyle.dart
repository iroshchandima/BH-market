
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


TextStyle appstyle(double size,Color color,FontWeight fW) {
  return GoogleFonts.poppins(fontSize: size, color: color, fontWeight: fW);
}
  TextStyle appstyle1(double fsize,Color color,FontWeight fW,double textHeight){
    return GoogleFonts.poppins(fontSize: fsize,color: color,fontWeight: fW,height: textHeight, );
}