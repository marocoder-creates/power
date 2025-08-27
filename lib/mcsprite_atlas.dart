import 'dart:convert';

// Main class to hold the entire sprite atlas data.
class MCSpriteAtlas {
  final MCMeta meta;
  final List<MCFrame> frames;

  MCSpriteAtlas({required this.meta, required this.frames});

  /// Factory constructor to create a MCSpriteAtlas from a JSON map.
  /// This is the helper method you requested.
  factory MCSpriteAtlas.fromJson(Map<String, dynamic> json) {
    // Ensure the 'frames' key exists and is a list.
    var framesList = json['frames'] as List? ?? [];

    // Map the list of frame JSON objects to a list of MCFrame objects.
    List<MCFrame> parsedFrames = framesList
        .map((frameJson) => MCFrame.fromJson(frameJson))
        .toList();

    return MCSpriteAtlas(
      meta: MCMeta.fromJson(json['meta'] ?? {}),
      frames: parsedFrames,
    );
  }

  /// Helper method to create a MCSpriteAtlas directly from a JSON string.
  factory MCSpriteAtlas.fromJsonString(String jsonString) {
    final Map<String, dynamic> data = json.decode(jsonString);
    return MCSpriteAtlas.fromJson(data);
  }
}

// Class to hold the metadata.
class MCMeta {
  final String image;
  final int width;
  final int height;
  final int cellWidth;
  final int cellHeight;

  MCMeta({
    required this.image,
    required this.width,
    required this.height,
    required this.cellWidth,
    required this.cellHeight,
  });

  /// Factory constructor to create MCMeta from a JSON map.
  factory MCMeta.fromJson(Map<String, dynamic> json) {
    return MCMeta(
      image: json['image'] ?? '',
      width: json['width'] ?? 0,
      height: json['height'] ?? 0,
      cellWidth: json['cellWidth'] ?? 0,
      cellHeight: json['cellHeight'] ?? 0,
    );
  }
}

// Class to hold the data for a single frame.
class MCFrame {
  final String name;
  final int x;
  final int y;
  final int width;
  final int height;
  final int row;
  final int col;
  final String md5;
  final String path;

  MCFrame({
    required this.name,
    required this.x,
    required this.y,
    required this.width,
    required this.height,
    required this.row,
    required this.col,
    required this.md5,
    required this.path,
  });

  /// Factory constructor to create a MCFrame from a JSON map.
  factory MCFrame.fromJson(Map<String, dynamic> json) {
    return MCFrame(
      name: json['name'] ?? '',
      x: json['x'] ?? 0,
      y: json['y'] ?? 0,
      width: json['width'] ?? 0,
      height: json['height'] ?? 0,
      row: json['row'] ?? 0,
      col: json['col'] ?? 0,
      md5: json['md5'] ?? '',
      path: json['path'] ?? '',
    );
  }
}
