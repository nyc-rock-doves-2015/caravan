Geocoder.configure(

  # geocoding service (see below for supported options):
  :lookup => :yandex,

  # geocoding service request timeout, in seconds (default 3):
  :timeout => 5,

  # set default units to miles:
  :units => :mi,

  ip_lookup: :telize
)