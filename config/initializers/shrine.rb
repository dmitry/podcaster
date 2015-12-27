require "shrine/storage/file_system"

Shrine.storages = {
  cache: Shrine::Storage::FileSystem.new("public", subdirectory: "system/cache"),
  store: Shrine::Storage::FileSystem.new("public", subdirectory: "system"),
}
