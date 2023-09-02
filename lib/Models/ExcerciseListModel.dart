// To parse this JSON data, do
//

import 'dart:convert';

List<ExcerciseListModel> excerciseListModelFromJson(String str) =>
    List<ExcerciseListModel>.from(
        json.decode(str).map((x) => ExcerciseListModel.fromJson(x)));

class ExcerciseListModel {
  String? bodyPart;
  String? equipment;
  String? gifUrl;
  String? id;
  String? name;
  String? target;

  ExcerciseListModel({
    this.bodyPart,
    this.equipment,
    this.gifUrl,
    this.id,
    this.name,
    this.target,
  });

  factory ExcerciseListModel.fromJson(Map<String, dynamic> json) =>
      ExcerciseListModel(
        bodyPart: json["bodyPart"],
        equipment: json["equipment"],
        gifUrl: json["gifUrl"],
        id: json["id"],
        name: json["name"],
        target: json["target"],
      );

  Map<String, dynamic> toJson() => {
        "bodyPart": bodyPart,
        "equipment": equipment,
        "gifUrl": gifUrl,
        "id": id,
        "name": name,
        "target": target,
      };
}
