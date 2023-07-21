import 'package:equatable/equatable.dart';

class Contract extends Equatable {
  final int time;
  final int activecontractcount;
  final double activecontractsize;
  final double activecontractcost;

  const Contract({
    this.time = 0,
    this.activecontractcount = 0,
    this.activecontractsize = 0.0,
    this.activecontractcost = 0.0,
  });

  Contract copyWith({
    int? time,
    int? activecontractcount,
    double? activecontractsize,
    double? activecontractcost,
  }) {
    return Contract(
      time: time ?? this.time,
      activecontractcount: activecontractcount ?? this.activecontractcount,
      activecontractsize: activecontractsize ?? this.activecontractsize,
      activecontractcost: activecontractcost ?? this.activecontractcost,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'time': time,
      'activecontractcount': activecontractcount,
      'activecontractsize': activecontractsize,
      'activecontractcost': activecontractcost,
    };
  }

  factory Contract.fromMap(Map<String, dynamic> map) {
    return Contract(
      time: map['time']?.toInt() ?? 0,
      activecontractcount: map['activecontractcount']?.toInt() ?? 0,
      activecontractsize: map['activecontractsize']?.toDouble() ?? 0.0,
      activecontractcost: map['activecontractcost']?.toDouble() ?? 0.0,
    );
  }

  @override
  List<Object> get props => [
        time,
        activecontractcount,
        activecontractsize,
        activecontractcost,
      ];
}
