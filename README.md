# Italian Job

The aim of this gem is to provide goodies for developers that are dealing with
typical italian business problem with rails 3+.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'italian_job', '~> 1.0'
```

And then execute:

    $ bundle

## Usage

```ruby
class MyClass < ActiveRecord::Base
  validates :my_attribute, presence: true, codice_fiscale_format: true
end
```

## Available Validators

* `codice_fiscale_format`: The Italian Tax code is called "Codice Fiscale".
For more information see [wikipedia](http://en.wikipedia.org/wiki/Italian_fiscal_code_card).

* `partita_iva_format`: The Italian VAT is called "Partita Iva". For more
information please see [wikipedia](http://en.wikipedia.org/wiki/Value_added_tax_identification_number).

## TODO

* update specs
* validate a field as codice fiscale OR partita iva

## License

This program is free software. It comes without any warranty,
to the extent permitted by applicable law. You can redistribute it and/or modify
it under the terms of the Do What The Fuck You Want To Public License, Version 2,
as published by Sam Hocevar. See http://www.wtfpl.net/ for more details.
