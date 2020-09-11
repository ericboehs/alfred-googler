# frozen_string_literal: true

# This is a copy of the script that is within the workflow. Modifying this
# script will not change the workflow's behavior.

query = ARGV.join ' '

exit 1 if query.strip.empty?

$LOAD_PATH.unshift File.dirname(__FILE__) + '/lightly/lib'

require 'json'
require 'lightly'

results = Lightly.new(life: '4h').get query do
  JSON.parse `/usr/local/bin/googler --json -n 9 #{query}`
end

output = {
  items: results.map do |result|
    host = URI.parse(result['url']).host

    {
      title: result['title'],
      subtitle: [host, result['metadata'], result['abstract']].compact.join(' '),
      arg: result['url'],
      quicklookurl: result['url'],
      autocomplete: result['title'],
      largetype: result['title'],
      mods: {
        alt: {
          valid: true,
          subtitle: result['title']
        },
        cmd: {
          valid: true,
          subtitle: result['url']
        }
      }
    }
  end
}

output = { items: [{ title: "No results for '#{query}'." }] } if output[:items].empty?

puts output.to_json
