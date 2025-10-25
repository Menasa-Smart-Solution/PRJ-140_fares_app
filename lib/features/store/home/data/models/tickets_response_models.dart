import 'package:json_annotation/json_annotation.dart';
part 'tickets_response_models.g.dart';

@JsonSerializable(checked: true)
class TicketsResponseModels {
  @JsonKey(name: 'data')
  final List<TicketsModel> tickets;

  TicketsResponseModels({required this.tickets});

  factory TicketsResponseModels.fromJson(Map<String, dynamic> json) =>
      _$TicketsResponseModelsFromJson(json);
}

@JsonSerializable(checked: true)
class TicketsModel {
  final int id;
  @JsonKey(name: 'parcel_id')
  final int parcelId;
  final String details;
  @JsonKey(name: 'created_at')
  final String createdAt;
  final String from;
  final String to;
  final TicketDeliveryman deliveryman;
  final TicketStatus status;

  TicketsModel({
    required this.id,
    required this.parcelId,
    required this.details,
    required this.createdAt,
    required this.from,
    required this.to,
    required this.deliveryman,
    required this.status,
  });

  factory TicketsModel.fromJson(Map<String, dynamic> json) =>
      _$TicketsModelFromJson(json);
}

@JsonSerializable(checked: true)
class TicketDeliveryman {
  final String name;
  final String phone;

  TicketDeliveryman({required this.name, required this.phone});

  factory TicketDeliveryman.fromJson(Map<String, dynamic> json) =>
      _$TicketDeliverymanFromJson(json);

  Map<String, dynamic> toJson() => _$TicketDeliverymanToJson(this);
}

@JsonSerializable(checked: true)
class TicketStatus {
  final String id;
  final String name;

  TicketStatus({required this.id, required this.name});

  factory TicketStatus.fromJson(Map<String, dynamic> json) =>
      _$TicketStatusFromJson(json);

  Map<String, dynamic> toJson() => _$TicketStatusToJson(this);
}

final List<TicketsModel> dummyTickets = [
  TicketsModel(
    id: 1,
    parcelId: 101,
    details: 'Package damaged during delivery',
    createdAt: '2025-10-20T12:30:00.000000Z',
    from: 'Tripoli',
    to: 'Benghazi',
    deliveryman: TicketDeliveryman(name: 'Ahmed Ali', phone: '+218912345678'),
    status: TicketStatus(id: '1', name: 'Pending'),
  ),
  TicketsModel(
    id: 2,
    parcelId: 102,
    details: 'Customer not available at address',
    createdAt: '2025-10-21T09:15:00.000000Z',
    from: 'Misrata',
    to: 'Tripoli',
    deliveryman: TicketDeliveryman(name: 'Omar Salem', phone: '+218923456789'),
    status: TicketStatus(id: '2', name: 'In Progress'),
  ),
  TicketsModel(
    id: 3,
    parcelId: 103,
    details: 'Delivery delayed due to traffic',
    createdAt: '2025-10-22T16:45:00.000000Z',
    from: 'Sabha',
    to: 'Zliten',
    deliveryman: TicketDeliveryman(
      name: 'Mahmoud Fathi',
      phone: '+218934567890',
    ),
    status: TicketStatus(id: '3', name: 'Resolved'),
  ),
  TicketsModel(
    id: 4,
    parcelId: 104,
    details: 'Wrong address provided',
    createdAt: '2025-10-23T08:00:00.000000Z',
    from: 'Derna',
    to: 'Tripoli',
    deliveryman: TicketDeliveryman(
      name: 'Khaled Mansour',
      phone: '+218945678901',
    ),
    status: TicketStatus(id: '1', name: 'Pending'),
  ),
  TicketsModel(
    id: 5,
    parcelId: 105,
    details: 'Customer requested delivery reschedule',
    createdAt: '2025-10-24T14:10:00.000000Z',
    from: 'Al Bayda',
    to: 'Benghazi',
    deliveryman: TicketDeliveryman(
      name: 'Yousef Mohammed',
      phone: '+218956789012',
    ),
    status: TicketStatus(id: '2', name: 'In Progress'),
  ),
  TicketsModel(
    id: 6,
    parcelId: 105,
    details: 'Customer requested delivery reschedule',
    createdAt: '2025-10-24T14:10:00.000000Z',
    from: 'Al Bayda',
    to: 'Benghazi',
    deliveryman: TicketDeliveryman(
      name: 'Yousef Mohammed',
      phone: '+218956789012',
    ),
    status: TicketStatus(id: '2', name: 'In Progress'),
  ),
  TicketsModel(
    id: 7,
    parcelId: 105,
    details: 'Customer requested delivery reschedule',
    createdAt: '2025-10-24T14:10:00.000000Z',
    from: 'Al Bayda',
    to: 'Benghazi',
    deliveryman: TicketDeliveryman(
      name: 'Yousef Mohammed',
      phone: '+218956789012',
    ),
    status: TicketStatus(id: '2', name: 'In Progress'),
  ),
  TicketsModel(
    id: 8,
    parcelId: 105,
    details: 'Customer requested delivery reschedule',
    createdAt: '2025-10-24T14:10:00.000000Z',
    from: 'Al Bayda',
    to: 'Benghazi',
    deliveryman: TicketDeliveryman(
      name: 'Yousef Mohammed',
      phone: '+218956789012',
    ),
    status: TicketStatus(id: '2', name: 'In Progress'),
  ),
];
