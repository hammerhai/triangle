# Changelog

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
