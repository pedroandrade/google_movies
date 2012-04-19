# GoogleMovies

Ruby wrapper to access google movies informations. 
Google does not provide a api interface to access google movies information, this gem get the html page of google movies and parser it using nokogiri to get the movies theaters information. 

## Installation

Add this line to your application's Gemfile:

    gem 'google_movies'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install google_movies

## Usage

		client = GoogleMovies::Client.new("Joao Pessoa")

### Getting Movies theaters and movies information.

		client.movies_theaters

### Contributers


* [Lucas Allan](http://github.com/lucasallan)
* [Maurício Voto](https://github.com/mvoto)

## License

###(The MIT License)

Copyright (c) 2012 Lucas Allan Amorim (www.lucasallan.com)

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the ‘Software’), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED ‘AS IS’, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.