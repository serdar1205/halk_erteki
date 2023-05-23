import 'package:flutter/material.dart';

@immutable
class CardTitleText extends Text {
  const CardTitleText(super.data);

  //final int? maxLine;

  @override
  String get data => "${super.data}";

  @override
  TextStyle get style => TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        height: 1.5,
      );

  @override
  TextOverflow get overflow => TextOverflow.fade;

  @override
  int get maxLines => 2;
}

@immutable
class TitleText extends Text {
  const TitleText(super.data);

  //final int? maxLine;

  @override
  String get data => "${super.data}";

  @override
  TextStyle get style => TextStyle(
    fontSize: 20,
    fontFamily: "Inter",
    fontWeight: FontWeight.w500,
    height: 1.5,
  );
}
@immutable
class BodyText extends Text {
   BodyText(super.data,{required  this.fontSize});

   double fontSize;
  //final int? maxLine;

  @override
  String get data => "${super.data}";

  @override
  TextStyle get style => TextStyle(
    fontSize: fontSize,
    fontFamily: "Martal",
    fontWeight: FontWeight.w400,
    height: 1.5,
  );
}
