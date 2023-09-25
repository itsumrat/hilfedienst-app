import 'package:hilfedienst/data/models/profile_model.dart';

class UserInfo {
  int? id;
  int? teamleaderId;
  String? personalNumber;
  String? firstName;
  String? lastName;
  String? userName;
  String? pToken;
  int? status;
  int? calenderView;
  String? scheduledHours;
  String? scheduledEnd;
  String? scheduledStart;
  String? timeInfo;
  int? yearForHolidays;
  int? holidayForYear;
  int? personalQuery;
  String? info;
  String? handSignals;
  String? wochenversorgung;
  String? monatsversorgung;
  String? lastActivity;
  String? intranetName;
  String? intranetLink;
  String? createdAt;
  String? updatedAt;
  int? profileCount;
  Profile? profile;

  UserInfo(
      {this.id,
      this.teamleaderId,
      this.personalNumber,
      this.firstName,
      this.lastName,
      this.userName,
      this.pToken,
      this.status,
      this.calenderView,
      this.scheduledHours,
      this.scheduledEnd,
      this.scheduledStart,
      this.timeInfo,
      this.yearForHolidays,
      this.holidayForYear,
      this.personalQuery,
      this.info,
      this.handSignals,
      this.wochenversorgung,
      this.monatsversorgung,
      this.lastActivity,
      this.intranetName,
      this.intranetLink,
      this.createdAt,
      this.updatedAt,
      this.profileCount,
      this.profile});

  UserInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    teamleaderId = json['teamleader_id'];
    personalNumber = json['personal_number'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    userName = json['user_name'];
    pToken = json['p_token'];
    status = json['status'];
    calenderView = json['calender_view'];
    scheduledHours = json['scheduled_hours'];
    scheduledEnd = json['scheduled_end'];
    scheduledStart = json['scheduled_start'];
    timeInfo = json['time_info'];
    yearForHolidays = json['year_for_holidays'];
    holidayForYear = json['holiday_for_year'];
    personalQuery = json['personal_query'];
    info = json['info'];
    handSignals = json['hand_signals'];
    wochenversorgung = json['wochenversorgung'];
    monatsversorgung = json['monatsversorgung'];
    lastActivity = json['last_activity'];
    intranetName = json['intranet_name'];
    intranetLink = json['intranet_link'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    profileCount = json['profile_count'];
    profile =
        json['profile'] != null ? Profile.fromJson(json['profile']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['teamleader_id'] = teamleaderId;
    data['personal_number'] = personalNumber;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['user_name'] = userName;
    data['p_token'] = pToken;
    data['status'] = status;
    data['calender_view'] = calenderView;
    data['scheduled_hours'] = scheduledHours;
    data['scheduled_end'] = scheduledEnd;
    data['scheduled_start'] = scheduledStart;
    data['time_info'] = timeInfo;
    data['year_for_holidays'] = yearForHolidays;
    data['holiday_for_year'] = holidayForYear;
    data['personal_query'] = personalQuery;
    data['info'] = info;
    data['hand_signals'] = handSignals;
    data['wochenversorgung'] = wochenversorgung;
    data['monatsversorgung'] = monatsversorgung;
    data['last_activity'] = lastActivity;
    data['intranet_name'] = intranetName;
    data['intranet_link'] = intranetLink;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['profile_count'] = profileCount;
    if (profile != null) {
      data['profile'] = profile!.toJson();
    }
    return data;
  }
}
