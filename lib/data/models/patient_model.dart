// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PatientModel {
  final int id;
  final String firstName;
  final String lastName;
  PatientModel({
    required this.id,
    required this.firstName,
    required this.lastName,
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
    };
  }

  factory PatientModel.fromMap(Map<String, dynamic> map) {
    return PatientModel(
      id: map['id'] as int,
      firstName: map['first_name'] as String,
      lastName: map['last_name'] as String,
    );
  }
  @override
  String toString() => 'PatientModel(id: $id, first_name: $firstName, last_name: $lastName)';

  @override
  bool operator ==(covariant PatientModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.firstName == firstName &&
      other.lastName == lastName;
  }

  @override
  int get hashCode => id.hashCode ^ firstName.hashCode ^ lastName.hashCode;
}
