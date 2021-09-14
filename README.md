# Libphonenumber

[![Hex.pm](https://img.shields.io/hexpm/v/ecto.svg)](https://hex.pm/packages/libphonenumber)

Elixir partial version of [libphonenumber](https://github.com/googlei18n/libphonenumber) by Google. Usage:

Check is phone number ([MSISDN](https://en.wikipedia.org/wiki/MSISDN))
```elixir
iex> Libphonenumber.mobile_phone_valid?("+380938562241")
true

iex> Libphonenumber.mobile_phone_valid?("+380338560241")
false

```
Get phone number info ([MSISDN](https://en.wikipedia.org/wiki/MSISDN))
```elixir
iex> Libphonenumber.mobile_phone_number_info("+380938562241")
%{
  country_metadata: %{code: "380", id: "UA", name: "Ukraine (UA)"},
  errors: [],
  phone: "+380938562241",
  valid: true
}

iex> Libphonenumber.mobile_phone_number_info("+380238562241")
%{
  errors: [
    %{'NO PAIRS' => 'Finished'},
    %{"3" => "No country code info found"},
    %{"38" => "No country code info found"},
    %{"380" => "Pattern '(?:50|6[36-8]|7[1-3]|9[1-9])\\d{7}' compilation failed"}
    ],
    valid: false
    }
```


## Installation

The package can be installed
by adding `libphonenumber` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:libphonenumber, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm/libphonenumber/). The docs can
be found at [https://hexdocs.pm/libphonenumber](https://hexdocs.pm/libphonenumber).