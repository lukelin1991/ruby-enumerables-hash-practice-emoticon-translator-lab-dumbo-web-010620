# require modules here
require 'yaml'
require 'pry'

def load_library(path)
  emoticons = YAML.load_file(path)
  emote_h = {:get_dets => {}, :get_emote => {}}

  emoticons.each do |eng_word, emote|
    emote_h[:get_emote][emote.first] = emote.last
    emote_h[:get_dets][emote.last] = eng_word
  end
  return emote_h
  # code goes here
end

def get_japanese_emoticon(path, emoticon)
  emoticon_hash = load_library(path)
  result = emoticon_hash[:get_emoticon][emoticon]
  if result == nil
    result = "Sorry, that emoticon was not found"
  end
  return result
  # code goes here
end

def get_english_meaning(path, emoticon)
  emoticon_hash = load_library(path)
  result = emoticon_hash[:get_meaning][emoticon]
  if result == nil
    result = "Sorry, that emoticon was not found"
  end
  return result
  # code goes here
end
