import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class InformationModel {
  String namelast;
  String phone;
  String address;
  InformationModel({
    required this.namelast,
    required this.phone,
    required this.address,
  });

  InformationModel copyWith({
    String? namelast,
    String? phone,
    String? address,
  }) {
    return InformationModel(
      namelast: namelast ?? this.namelast,
      phone: phone ?? this.phone,
      address: address ?? this.address,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'namelast': namelast,
      'phone': phone,
      'address': address,
    };
  }

  factory InformationModel.fromMap(Map<String, dynamic> map) {
    return InformationModel(
      namelast: map['namelast'] as String,
      phone: map['phone'] as String,
      address: map['address'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory InformationModel.fromJson(String source) => InformationModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'InformationModel(namelast: $namelast, phone: $phone, address: $address)';

  @override
  bool operator ==(covariant InformationModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.namelast == namelast &&
      other.phone == phone &&
      other.address == address;
  }

  @override
  int get hashCode => namelast.hashCode ^ phone.hashCode ^ address.hashCode;
}
