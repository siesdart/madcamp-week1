// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as int,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      age: json['age'] as int,
      email: json['email'] as String,
      phone: json['phone'] as String,
      birthDate: json['birthDate'] as String,
      image: json['image'] as String,
      address: Address.fromJson(json['address'] as Map<String, dynamic>),
      company: Company.fromJson(json['company'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'age': instance.age,
      'email': instance.email,
      'phone': instance.phone,
      'birthDate': instance.birthDate,
      'image': instance.image,
      'address': instance.address,
      'company': instance.company,
    };

Address _$AddressFromJson(Map<String, dynamic> json) => Address(
      address: json['address'] as String?,
      city: json['city'] as String?,
      coordinates: json['coordinates'] == null
          ? null
          : Coordinates.fromJson(json['coordinates'] as Map<String, dynamic>),
      postalCode: json['postalCode'] as String?,
      state: json['state'] as String?,
    );

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'address': instance.address,
      'city': instance.city,
      'coordinates': instance.coordinates,
      'postalCode': instance.postalCode,
      'state': instance.state,
    };

Coordinates _$CoordinatesFromJson(Map<String, dynamic> json) => Coordinates(
      lat: (json['lat'] as num?)?.toDouble(),
      lng: (json['lng'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$CoordinatesToJson(Coordinates instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
    };

Company _$CompanyFromJson(Map<String, dynamic> json) => Company(
      address: json['address'] == null
          ? null
          : Address.fromJson(json['address'] as Map<String, dynamic>),
      department: json['department'] as String?,
      name: json['name'] as String?,
      title: json['title'] as String?,
    );

Map<String, dynamic> _$CompanyToJson(Company instance) => <String, dynamic>{
      'address': instance.address,
      'department': instance.department,
      'name': instance.name,
      'title': instance.title,
    };
