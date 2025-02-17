import 'package:flutter/material.dart';

class MinecraftColors {
  static final List<MinecraftColor> colors = [
    MinecraftColor(name: 'Black', code: '§0', color: const Color(0xFF000000)),
    MinecraftColor(name: 'Dark Blue', code: '§1', color: const Color(0xFF0000AA)),
    MinecraftColor(name: 'Dark Green', code: '§2', color: const Color(0xFF00AA00)),
    MinecraftColor(name: 'Dark Aqua', code: '§3', color: const Color(0xFF00AAAA)),
    MinecraftColor(name: 'Dark Red', code: '§4', color: const Color(0xFFAA0000)),
    MinecraftColor(name: 'Dark Purple', code: '§5', color: const Color(0xFFAA00AA)),
    MinecraftColor(name: 'Gold', code: '§6', color: const Color(0xFFFFAA00)),
    MinecraftColor(name: 'Gray', code: '§7', color: const Color(0xFFAAAAAA)),
    MinecraftColor(name: 'Dark Gray', code: '§8', color: const Color(0xFF555555)),
    MinecraftColor(name: 'Blue', code: '§9', color: const Color(0xFF5555FF)),
    MinecraftColor(name: 'Green', code: '§a', color: const Color(0xFF55FF55)),
    MinecraftColor(name: 'Aqua', code: '§b', color: const Color(0xFF55FFFF)),
    MinecraftColor(name: 'Red', code: '§c', color: const Color(0xFFFF5555)),
    MinecraftColor(name: 'Light Purple', code: '§d', color: const Color(0xFFFF55FF)),
    MinecraftColor(name: 'Yellow', code: '§e', color: const Color(0xFFFFFF55)),
    MinecraftColor(name: 'White', code: '§f', color: const Color(0xFFFFFFFF))
  ];

  
  static Color getColorFromCode({required String colorCode}) {
    for (var color in colors) {
      if (color.code == colorCode) {
        return color.color;
      }
    }
    return const Color(0xFFFFFFFF);
  }
}

class MinecraftColor {
  final String name;
  final String code;
  final Color color;

  MinecraftColor({required this.name, required this.code, required this.color});
}
