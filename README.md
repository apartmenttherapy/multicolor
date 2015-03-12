# Multicolor

An opinionated library to ease usage of TinEye's fabulous MulticolorEngine
http://services.tineye.com/MulticolorEngine.

Full API documentation available at http://multicolorengine.tineye.com/docs/

## Installation

Add this line to your application's Gemfile:

    gem 'multicolor'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install multicolor

## Usage

### Instantiating a client

```ruby
client = Multicolor::REST::Client.new do |client|
  client.config.company      = "<api-company>"
  client.config.username     = "<api-username>"
  client.config.password     = "<password>"
end
```

### Adding or deleting items

```ruby
data = [
  {
    url: "http://url-to-image",
    filepath: "filepath-string",
    metadata: {
      ...
    }
  },
  {
    url: "http://url-to-other-image",
    filepath: "another-filepath-string",
    metadata: {
      ...
    }
  },
]

client.add(data)

client.delete([filepath_string, another_filepath_string] )
client.delete(filepath_string) # pass a single filepath to delete a single image
```

### searching the index

```ruby
# searching for similar colors
params = {
  colors: [
    {
      color: #rgb or hex
      width: 1-100
    }...
  ],
  min_score: 0-11
  offset: integer
  ...
}

# Multicolor::REST::SearchBuilder is a convenience method
# that formats params to format required by
# the MulticolorEngine, eg: color[0], color[1]....
search_options = Multicolor::REST::SearchBuilder.new(params).request

response = client.color_search(search_options)
response.body # returns API response
```

### Metadata

```ruby

# extract colors for n images identified by filepath
options = {
  filepaths: [filepath_string, another_filepath_string]
  limit: 20
}
client.extract_collection_colors(options)

# extract metadata for n images
client.get_metadata(filepaths: [filepath_string])
```

### Info

```ruby
# counting items in the collection/index
client.count

# List the images present in your API.
client.list

# pinging the API to see if the Piximilar search server is running.
client.ping
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
