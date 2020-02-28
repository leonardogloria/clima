defmodule App.Weather.Test do
    use ExUnit.Case, async: true
    @api  "http://api.openweathermap.org/data/2.5/weather?q="

    test "should return an encoded endpoint when take a location" do
        appid = App.Weather.get_appid()
        endpoint = App.Weather.get_endpoint("Rio de Janeiro")
        assert "#{@api}Rio%20de%20Janeiro&appid=#{appid}" == endpoint
    end
    test "should return Celcius when take Kelvin" do
        kelvin_example = 296.48
        celcius_example = 23.3
        temperature = App.Weather.kelvin_to_celcius(kelvin_example)
        assert temperature == celcius_example
    end
    test "should return a temperature when take a valid location" do
        rio_de_janeiro = "Rio de Janeiro"
        temperature = App.Weather.temperature_of(rio_de_janeiro)
        assert String.contains?(temperature, "Rio de Janeiro") == true
    end
    test "should return not dound when take an invalid location" do
        location = "00000"
        result = App.Weather.temperature_of(location)

        assert result = "00000 not found"
        
    end
    





end