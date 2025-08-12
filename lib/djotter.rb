# frozen_string_literal: true

require "djotter/version"
require "djotter/djotter"

module Djotter
  class << self
    # Public: Parses and converts a Djot string into an HTML string.
    #
    # content - A {String} of text
    #
    # Returns a {String} of converted HTML.
    def to_html(content)
      raise TypeError, "text must be as String; got #{content.class}" unless content.is_a?(String)
      raise TypeError, "text must e UTF-8 encoded; got #{content.encoding}" unless content.encoding.name == "UTF-8"

      djot_to_html(content)
    end
  end
end
