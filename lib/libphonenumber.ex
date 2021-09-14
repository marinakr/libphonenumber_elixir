defmodule Libphonenumber do
  @moduledoc """
  Documentation for `Libphonenumber`.
  """

  @spec mobile_phone_valid?(binary) :: boolean
  @doc """
  Check is mobile phone valid (phone number must be MSISDN)

  ## Examples

      iex> Libphonenumber.mobile_phone_valid?("+380938562241")
      true

  """
  def mobile_phone_valid?(phone_number) do
    :libphonenumbers.is_mobile_phone_valid(phone_number)
  end

  @spec mobile_phone_number_info(binary) :: %{
          :errors => [:null | map],
          :valid => boolean,
          optional(:country_metadata) => %{code: binary, id: any, name: any},
          optional(:phone) => binary
        }
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

  def mobile_phone_number_info(phone_number) do
    :libphonenumbers.mobile_phone_number_info(phone_number)
  end
end
