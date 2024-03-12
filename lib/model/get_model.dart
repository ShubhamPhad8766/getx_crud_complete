// To parse this JSON data, do
//
//     final getModel = getModelFromJson(jsonString);

import 'dart:convert';

GetModel getModelFromJson(String str) => GetModel.fromJson(json.decode(str));

String getModelToJson(GetModel data) => json.encode(data.toJson());

class GetModel {
  String? message;
  List<Datum>? data;
  int? totalItemsCount;
  int? page;
  int? size;

  GetModel({
    this.message,
    this.data,
    this.totalItemsCount,
    this.page,
    this.size,
  });

  factory GetModel.fromJson(Map<String, dynamic> json) => GetModel(
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
        totalItemsCount: json["totalItemsCount"],
        page: json["page"],
        size: json["size"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "totalItemsCount": totalItemsCount,
        "page": page,
        "size": size,
      };
}

class Datum {
  String? id;
  int? leaveTypeId;
  int? userId;
  int? leaveId;
  int? groupId;
  String? status;
  int? leaveYear;
  int? approvedBy;
  DateTime? startDate;
  DateTime? endDate;
  String? leaveType;
  String? desperation;
  String? approver;
  int? totalLeaveDays;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Datum({
    this.id,
    this.leaveTypeId,
    this.userId,
    this.leaveId,
    this.groupId,
    this.status,
    this.leaveYear,
    this.approvedBy,
    this.startDate,
    this.endDate,
    this.leaveType,
    this.desperation,
    this.approver,
    this.totalLeaveDays,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        leaveTypeId: json["leaveTypeId"],
        userId: json["userId"],
        leaveId: json["leaveId"],
        groupId: json["groupId"],
        status: json["status"],
        leaveYear: json["leaveYear"],
        approvedBy: json["approvedBy"],
        startDate: json["start_date"] == null
            ? null
            : DateTime.parse(json["start_date"]),
        endDate:
            json["end_date"] == null ? null : DateTime.parse(json["end_date"]),
        leaveType: json["leaveType"],
        desperation: json["desperation"],
        approver: json["approver"],
        totalLeaveDays: json["total_leave_days"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "leaveTypeId": leaveTypeId,
        "userId": userId,
        "leaveId": leaveId,
        "groupId": groupId,
        "status": status,
        "leaveYear": leaveYear,
        "approvedBy": approvedBy,
        "start_date": startDate?.toIso8601String(),
        "end_date": endDate?.toIso8601String(),
        "leaveType": leaveType,
        "desperation": desperation,
        "approver": approver,
        "total_leave_days": totalLeaveDays,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}
