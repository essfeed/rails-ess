rails-ess [![ESS Feed Standard](http://essfeed.org/images/8/87/ESS_logo_32x32.png)](http://essfeed.org/)
========================================================================================================

[![Build Status](https://travis-ci.org/essfeed/rails-ess.png)](https://travis-ci.org/essfeed/rails-ess)

Generate ESS XML feeds with Ruby-on-Rails

## Installation

Add this line to your application's Gemfile:

    gem 'rails-ess', '~> 0.9.3'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rails-ess -v "0.9.3"

## Usage

This little gem extends Rails so that it becomes easy to create ESS feeds
in your web application.

It adds the 'application/ess+xml' MIME type, which means that to add
an auto discovery link tag for an ESS feed, it's enough to add the
following to the head section of a web page:

```ruby

  auto_discovery_link_tag(:ess, {:controller => "events", :action => "feed"})

```

And also, in a controller to respond with an ESS document:

```ruby

  def feed
      @events = Event.all(:limit => 20) 

      respond_to do |format|
        format.html
        format.ess { render :layout => false } #feed.ess.builder
      end
  end

```

This gem also adds a helper method which can be used in builder
templates:

```ruby

ess_feed(:push => true, :request => request) do |ess|
  ess.channel do |channel|
    channel.title "National Stadium Football events"
    channel.link "http://sample.com/feeds/sample.ess"

    ...

    @events.each do |event|
      channel.add_feed do |feed|
        feed.title        event.title
        feed.uri          event.link
        feed.description  event.description

        feed.tags do |tags|
          tags.tag "Sport"
          tags.tag "Team Sport"
          tags.tag "Stadium"
        end

        ...

      end
    end
  end
end

```

More information on building a feed in Ruby can be found in the README
of the 'ess' gem: https://github.com/essfeed/ruby-ess .

More information on ESS and what tags and options are available can
be found on http://essfeed.org/ .

## Contributing

Contributions to the project are welcome. Feel free to fork and improve. I accept pull requests and issues,
especially when tests are included.

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

# License

(The MIT License)

Copyright (c) 2013 Hypecal

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
