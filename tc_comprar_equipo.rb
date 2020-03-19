require 'watir'
require './LibraryMovistar.rb'

chromedriver_path = File.join(File.absolute_path('../..', File.dirname(__FILE__)),"chromedriver.exe")
Selenium::WebDriver::Chrome.driver_path = chromedriver_path
@b = Watir::Browser.new  :chrome

# Entrar al sitio
@b.goto"https://tienda.movistar.com.mx/"
@b.window.maximize
movistar = LibraryMovistar.new(@b)

movistar.seleccionar_equipos
movistar.registrar_datos_equipo('pruebas@gmail.com','Alberto','Rodriguez','Garcia','812776908','ABCD980710')


