defmodule Libphonenumber do
  @moduledoc """
  Documentation for `Libphonenumber`.
  """

  @doc """
  Check is mobile phone valid (phone number must be MSISDN)

  ## Examples

      iex> Libphonenumber.mobile_phone_valid?("+380938562241")
      true

      iex> Libphonenumber.mobile_phone_valid?("+380338560241")
      false

  """
  @spec mobile_phone_valid?(binary) :: boolean
  def mobile_phone_valid?(phone_number) do
    :libphonenumbers.is_mobile_phone_valid(phone_number)
  end

  @doc """
  Show mobile phone validation info (phone number must be MSISDN)

  ## Examples

      iex> Libphonenumber.mobile_phone_number_info("+380938562241")
      %{
        country_metadata: %{code: "380", id: "UA", name: "Ukraine (UA)"},
        errors: [],
        phone: "+380938562241",
        valid: true
      }
  """
  @spec mobile_phone_number_info(binary) :: %{
          :errors => [:null | map],
          :valid => boolean,
          optional(:country_metadata) => %{code: binary, id: any, name: any},
          optional(:phone) => binary
        }

  def mobile_phone_number_info(phone_number) do
    :libphonenumbers.mobile_phone_number_info(phone_number)
  end
end
