defmodule LibphonenumberTest do
  use ExUnit.Case
  doctest Libphonenumber

  describe "mobile_phone_valid?/1" do
    test "false for nil" do
      refute Libphonenumber.mobile_phone_valid?(nil)
    end

    test "false for invalid " do
      refute Libphonenumber.mobile_phone_valid?("+380338560241")
    end

    test "success for valid" do
      assert Libphonenumber.mobile_phone_valid?("+380938562241")
    end
  end

  describe "mobile_phone_number_info/1" do
    test "success for nil" do
      assert %{errors: [%{'NO CODE' => "Phone number should starts with '+'"}], valid: false} =
               Libphonenumber.mobile_phone_number_info(nil)
    end

    test "success for valid" do
      assert %{
               country_metadata: %{code: "380", id: "UA", name: "Ukraine (UA)"},
               errors: [],
               phone: "+380938562241",
               valid: true
             } = Libphonenumber.mobile_phone_number_info("+380938562241")

      assert %{
               country_metadata: %{code: "1", id: "US", name: "United States (US)"},
               errors: [],
               phone: "+14088881406",
               valid: true
             } = Libphonenumber.mobile_phone_number_info("+14088881406")
    end

    test "success for invalid" do
      assert %{
               errors: [
                 %{'NO PAIRS' => 'Finished'},
                 %{"3" => "No country code info found"},
                 %{"38" => "No country code info found"},
                 %{
                   "380" => "Pattern '(?:50|6[36-8]|7[1-3]|9[1-9])\\d{7}' compilation failed"
                 }
               ],
               valid: false
             } = Libphonenumber.mobile_phone_number_info("+380238562241")
    end
  end
end
