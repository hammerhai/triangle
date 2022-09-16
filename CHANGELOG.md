# Changelog

## 2.0.0

### Changed

- 🍱 Updated [banner.png](https://github.com/hammerhai/triangle-dart/assets/banner.png) 
- 📝 Updated documentation
- ⬆️ Upgraded [Lints](https://pub.dev/packages/lints) to v2.0.0<sup>1</sup>

<sup>1</sup> Included was a change to the Dart SDK constraint.

### Removed

- ⚰️ Previously deprecated method, `Triangle.shiftDirectory`, was removed

## 1.3.2

### Changed

- 🎨 Ensure `Triangle.home` is never null

## 1.3.1

### Fixed

- 🛂 Allow the `Triangle` class to be accessed

## 1.3.0

### Added

- ✨ Exposed API to get the home directory

## 1.2.0

### Removed

Triangle is made on the belief that the path to directories should be given, no more than that. Adding more functionality than just returning a path of a directory would defeat the purpose of many other packages out there. In a way, it could be noted as anti-competitive.

For this specific deprecation, the use of `dart:io` is recommended as an alternative.

- 🗑️ With this now said, the `shiftDirectory` has been deprecated, but will continue to function normally until its complete removal

## 1.1.0

### Added

- ✨ Move files from one directory to another with `shiftDirectory`

### Changed

- ⚡️ Polished internal functions

### Removed

- ⚰️ Erased unnecessary variable null safety

## 1.0.0

- 🥳 Initial release
