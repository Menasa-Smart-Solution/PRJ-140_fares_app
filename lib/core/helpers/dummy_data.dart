import 'package:fares/features/driver/orders/data/models/parcels_response_model.dart';

import '../../features/driver/chat/data/models/conversations_response_model.dart'
    show ConversationModel, StoreModel, MessageModel;

final dummyConversation = ConversationModel(
  id: 101,
  branchId: "BR-001",
  storeId: "ST-123",
  parcelId: "PC-789",
  lastMessageId: "MSG-555",
  createdAt: "2025-10-10T14:23:00Z",
  updatedAt: "2025-10-11T08:45:00Z",
  store: StoreModel(
    id: 123,
    branchId: "BR-001",
    parentStoreId: "ST-001",
    name: "TechZone Electronics",
    ownerName: "Ahmed Mostafa",
    email: "contact@techzone.com",
    phone: "+201001234567",
    phone2: "+201112345678",
    address: "12 Nasr City, Cairo, Egypt",
  ),
  parcel: ParcelModel(
    id: 789,
    branchId: "BR-001",
    status: "In Transit",
    createdAt: "2025-10-10T09:15:00Z",
    updatedAt: "2025-10-10T09:45:00Z",
  ),
  lastMessage: MessageModel(
    id: 555,
    branchId: "BR-001",
    chatId: "CH-999",
    storeId: "ST-123",
    userId: "USR-888",
    parcelId: "PC-789",
    deliveryManId: "DM-222",
    details: "Your order is on the way 🚚",
    createdAt: "2025-10-10T15:10:00Z",
    updatedAt: "2025-10-10T15:11:00Z",
  ),
);
