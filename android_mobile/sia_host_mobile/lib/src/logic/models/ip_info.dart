import 'package:equatable/equatable.dart';

class IpInfo extends Equatable {
  final String ip;
  final String hostname;
  final String city;
  final String region;
  final String country;
  final String loc;
  final String org;
  final String postal;
  final String timezone;

  const IpInfo({
    this.ip = "",
    this.city = "",
    this.hostname = "",
    this.region = "",
    this.country = "",
    this.loc = "",
    this.org = "",
    this.postal = "",
    this.timezone = "",
  });

  IpInfo copyWith({
    String? ip,
    String? hostname,
    String? city,
    String? region,
    String? country,
    String? loc,
    String? org,
    String? postal,
    String? timezone,
  }) {
    return IpInfo(
      ip: ip ?? this.ip,
      hostname: hostname ?? this.hostname,
      city: city ?? this.city,
      region: region ?? this.region,
      country: country ?? this.country,
      loc: loc ?? this.loc,
      org: org ?? this.org,
      postal: postal ?? this.postal,
      timezone: timezone ?? this.timezone,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'ip': ip,
      'hostname': hostname,
      'city': city,
      'region': region,
      'country': country,
      'loc': loc,
      'org': org,
      'postal': postal,
      'timezone': timezone,
    };
  }

  factory IpInfo.fromMap(Map<String, dynamic> map) {
    return IpInfo(
      ip: map['ip'] ?? '',
      hostname: map['hostname'] ?? '',
      city: map['city'] ?? '',
      region: map['region'] ?? '',
      country: map['country'] ?? '',
      loc: map['loc'] ?? '',
      org: map['org'] ?? '',
      postal: map['postal'] ?? '',
      timezone: map['timezone'] ?? '',
    );
  }

  @override
  List<Object> get props {
    return [
      ip,
      hostname,
      city,
      region,
      country,
      loc,
      org,
      postal,
      timezone,
    ];
  }
}
