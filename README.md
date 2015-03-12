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
options = {}
client.color_search(options)

options = {}
client.extract_image_colors()

options = {}
client.count_image_colors
```

### Metadata

GET extract_collection_colors
GET count_collection_colors
GET count_metadata
POST update_metadata
GET get_metadata
GET get_search_metadata
GET get_return_metadata

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
