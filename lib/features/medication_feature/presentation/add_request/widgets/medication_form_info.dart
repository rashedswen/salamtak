import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:salamtak/core/enums/medication_form.dart';

final medicineFormList = [
  MedicineFormInfo(
    form: MedicineForm.tablet,
    icon: FontAwesomeIcons.tablets,
    color: Colors.blue,
  ),
  MedicineFormInfo(
    form: MedicineForm.capsule,
    icon: FontAwesomeIcons.capsules,
    color: Colors.blue,
  ),
  MedicineFormInfo(
    form: MedicineForm.syrup,
    icon: FontAwesomeIcons.prescriptionBottleMedical,
    color: Colors.blue,
  ),
  MedicineFormInfo(
    form: MedicineForm.injection,
    icon: FontAwesomeIcons.syringe,
    color: Colors.blue,
  ),
  MedicineFormInfo(
    form: MedicineForm.ointment,
    icon: FontAwesomeIcons.accusoft,
    color: Colors.blue,
  ),
  // TODO(add appropiate icon): this is not the right icon
  MedicineFormInfo(
    form: MedicineForm.drops,
    icon: FontAwesomeIcons.eyeDropper,
    color: Colors.blue,
  ),
  MedicineFormInfo(
    form: MedicineForm.inhaler,
    icon: FontAwesomeIcons.sprayCanSparkles,
    color: Colors.blue,
  ),
  MedicineFormInfo(
    form: MedicineForm.other,
    icon: FontAwesomeIcons.x,
    color: Colors.blue,
  ),
];

class MedicineFormInfo {
  MedicineFormInfo({
    required this.form,
    required this.icon,
    required this.color,
  });

  final MedicineForm form;
  final IconData icon;
  final Color color;
}
