/*
* الخطوات للعمل في hive
* ملاحضة مهم عن Hive الهاف تقوم بخزن متغيرات من نوع متغيرات معروفه  لكن اذا ارت ان تخزن من نوع object اي نوع بيانات اني اسوية فلازم اسوي جنريت لفكشن اسمه TypeAdapter
* 1- اخلي الكلاس لي تحت يرث من HiveObject وهذا الخطوه اختيارية
* 2- اعمل للكلاس HiveType(typeId: 0) وعطيه ip خاص بهذا الكلاس اي اذا عملة كلاس جديدة وريد اطبق عليه هاي الخطوه لازم ما يشابهن بال IP
* 3- اضيف فوق البروبرتيز لي عدي HiveField(0)@ وطيه ip وهذا ال ip هنا يكون خاص بس بداخل الكلاس وقوم بعطاء لكل متغير ip كما هو موجود تحت
* 4- اعمل جنريتر لهذا االكود . حتى اعمل جنريتر
* أ- اكتب part وعطيه اسم الملف لي رايد اعملة جنريتر وهذا ال part تشبه ال import ولكن هناك اختلافات اخرى
* ب_ اكتب في Terminal هذا الكود (flutter packages pub run build_runner build)
* 5- نذهب الى main ونضيف بعض الخطوات */

import 'package:hive/hive.dart';
part 'notes_model.g.dart';

@HiveType(typeId: 0)
class NoteModel extends HiveObject{
  @HiveField(0)
   String title;
  @HiveField(1)
   String subTitle;
  @HiveField(2)
  final String data;
  @HiveField(3)
   int color;

  NoteModel(
      {required this.title,
      required this.subTitle,
      required this.data,
      required this.color});
}
