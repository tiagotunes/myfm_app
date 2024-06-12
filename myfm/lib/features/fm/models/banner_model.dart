import 'package:cloud_firestore/cloud_firestore.dart';

class BannerModel {
  String imageUrl;
  int order;
  final String targetScreen;
  final bool active;

  BannerModel({
    required this.order,
    required this.imageUrl,
    required this.targetScreen,
    required this.active,
  });

  Map<String, dynamic> toJson() {
    return {
      'order': order,
      'image_url': imageUrl,
      'target_screen': targetScreen,
      'active': active,
    };
  }

  factory BannerModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return BannerModel(
      order: data['order'] ?? 0,
      imageUrl: data['image_url'] ?? '',
      targetScreen: data['target_screen'] ?? '',
      active: data['active'] ?? false,
    );
  }
}
