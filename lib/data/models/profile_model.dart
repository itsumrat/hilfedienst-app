
class Profile {
  int? id;
  int? employeeId;
  String? gender;
  String? firstName;
  String? sureName;
  String? streetNo;
  String? postcodeTown;
  String? dob;
  String? telephone;
  String? mobile;
  String? socialSecurityNumber;
  int? maritalStatus;
  String? placeOfBirth;
  String? nationality;
  int? severelyDisabled;
  int? typeOfEmployment;
  int? moreOccupation;
  int? highestSchoolDegree;
  int? highestVocationalEducation;
  String? identificationNo;
  int? taxClass;
  int? children;
  String? childAllowance;
  String? denomination;
  String? healthInsurance;
  String? bank;
  int? isApprove;
  String? approvedBy;
  int? fieldUpdatedBy;
  String? createdAt;
  String? updatedAt;

  Profile(
      {this.id,
      this.employeeId,
      this.gender,
      this.firstName,
      this.sureName,
      this.streetNo,
      this.postcodeTown,
      this.dob,
      this.telephone,
      this.mobile,
      this.socialSecurityNumber,
      this.maritalStatus,
      this.placeOfBirth,
      this.nationality,
      this.severelyDisabled,
      this.typeOfEmployment,
      this.moreOccupation,
      this.highestSchoolDegree,
      this.highestVocationalEducation,
      this.identificationNo,
      this.taxClass,
      this.children,
      this.childAllowance,
      this.denomination,
      this.healthInsurance,
      this.bank,
      this.isApprove,
      this.approvedBy,
      this.fieldUpdatedBy,
      this.createdAt,
      this.updatedAt});

  Profile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    employeeId = json['employee_id'];
    gender = json['gender'];
    firstName = json['first_name'];
    sureName = json['sure_name'];
    streetNo = json['street_no'];
    postcodeTown = json['postcode_town'];
    dob = json['dob'];
    telephone = json['telephone'];
    mobile = json['mobile'];
    socialSecurityNumber = json['social_security_number'];
    maritalStatus = json['marital_status'];
    placeOfBirth = json['place_of_birth'];
    nationality = json['nationality'];
    severelyDisabled = json['severely_disabled'];
    typeOfEmployment = json['type_of_employment'];
    moreOccupation = json['more_occupation'];
    highestSchoolDegree = json['highest_school_degree'];
    highestVocationalEducation = json['highest_vocational_education'];
    identificationNo = json['identification_no'];
    taxClass = json['tax_class'];
    children = json['children'];
    childAllowance = json['child_allowance'];
    denomination = json['denomination'];
    healthInsurance = json['health_insurance'];
    bank = json['bank'];
    isApprove = json['is_approve'];
    approvedBy = json['approved_by'];
    fieldUpdatedBy = json['field_updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['employee_id'] = employeeId;
    data['gender'] = gender;
    data['first_name'] = firstName;
    data['sure_name'] = sureName;
    data['street_no'] = streetNo;
    data['postcode_town'] = postcodeTown;
    data['dob'] = dob;
    data['telephone'] = telephone;
    data['mobile'] = mobile;
    data['social_security_number'] = socialSecurityNumber;
    data['marital_status'] = maritalStatus;
    data['place_of_birth'] = placeOfBirth;
    data['nationality'] = nationality;
    data['severely_disabled'] = severelyDisabled;
    data['type_of_employment'] = typeOfEmployment;
    data['more_occupation'] = moreOccupation;
    data['highest_school_degree'] = highestSchoolDegree;
    data['highest_vocational_education'] = highestVocationalEducation;
    data['identification_no'] = identificationNo;
    data['tax_class'] = taxClass;
    data['children'] = children;
    data['child_allowance'] = childAllowance;
    data['denomination'] = denomination;
    data['health_insurance'] = healthInsurance;
    data['bank'] = bank;
    data['is_approve'] = isApprove;
    data['approved_by'] = approvedBy;
    data['field_updated_by'] = fieldUpdatedBy;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
