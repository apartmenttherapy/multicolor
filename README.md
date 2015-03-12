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

### Adding items to the collection

```ruby
client.add
client.delete
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
