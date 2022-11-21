import 'package:flutter/material.dart';
import 'package:get/get.dart';

var popButton = Padding(
  padding: const EdgeInsets.only(
    top: 40,
    left: 40,
  ),
  child: InkWell(
    borderRadius: BorderRadius.circular(50),
    onTap: () => Get.back(),
    child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
            color: Colors.grey[100], borderRadius: BorderRadius.circular(50)),
        child: Icon(
          Icons.arrow_back_ios,
          size: 14,
        )),
  ),
);
