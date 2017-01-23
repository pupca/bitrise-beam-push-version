require 'open-uri'
release_notes = ""
open(ENV['release_notes_url']) { |io| release_notes = io.read }
file_size = File.size(ENV['build_file_path'])
comand = "/usr/libexec/PlistBuddy -c 'Print :CFBundleShortVersionString' '#{ENV['BITRISE_SOURCE_DIR']}#{ENV['info_plist_file_path']}'"
short_version = `#{comand}`
hockey_url = ENV['hockey_url'].strip
version = ENV['version'].strip
build_url = ENV['build_url'].strip
enviroment = ENV['enviroment'].strip
api_key = ENV['api_key'].strip
api_url = ENV['api_url'].strip


puts release_notes
puts file_size
puts short_version
puts hockey_url
puts version
puts build_url
puts enviroment


uri = URI(api_url)
res = Net::HTTP.post_form(uri, release_notes: release_notes, file_size: file_size, short_version: short_version.strip, hockey_url: hockey_url, version: version, build_url: build_url, enviroment: enviroment, key: api_key)
puts res.body