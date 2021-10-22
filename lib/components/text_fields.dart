import 'package:flutter/material.dart';
import 'package:demonstration_project/constants/colors.dart';

const kTextFieldDecoration = InputDecoration(
  hintText: 'Enter a value',
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kColorPrimary, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kColorDarkPrimary, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);

const kSelectInputDecoration = InputDecoration(
  hintText: 'Enter a value',
  contentPadding: EdgeInsets.only(
    top: 0,
    bottom: 0,
    left: 20.0,
    right: 8.0,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kColorPrimary, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kColorDarkPrimary, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);

const kSelectSquare = InputDecoration(
  hintText: 'Enter a value',
  contentPadding: EdgeInsets.only(
    top: 0,
    bottom: 0,
    left: 20.0,
    right: 8.0,
  ),
  border: InputBorder.none,
  fillColor: kColorPrimary,
  filled: true,
);
