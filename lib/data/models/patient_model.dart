// ignore_for_file: public_member_api_docs, sort_constructors_first

class PatientModel {
  final int id;
  final String firstName;
  final String lastName;
  final String? road;
  final String? place;
  final String? postCode;
  PatientModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    this.road,
    this.place,
    this.postCode,
  });

  PatientModel copyWith({
    int? id,
    String? firstName,
    String? lastName,
  }) {
    return PatientModel(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'first_name': firstName,
      'last_name': lastName,
      'road': road,
      'place': place,
      'post_code': postCode,
    };
  }

  factory PatientModel.fromMap(Map<String, dynamic> map) {
    return PatientModel(
      id: map['id'] as int,
      firstName: map['first_name'] as String,
      lastName: map['last_name'] as String,
      road: map['road'] as String?,
      place: map['place'] as String?,
      postCode: map['post_code'] as String?,
    );
  }
  @override
  String toString() =>
      'PatientModel(id: $id, first_name: $firstName, last_name: $lastName, road: $road, place: $place, post_code: $postCode)';

  @override
  bool operator ==(covariant PatientModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.road == road &&
        other.place == place &&
        other.postCode == postCode;
  }

  @override
  int get hashCode =>
      id.hashCode ^ firstName.hashCode ^ lastName.hashCode ^ road.hashCode ^ place.hashCode ^ postCode.hashCode;
}
