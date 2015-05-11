Geocoder.configure(

  # geocoding service (see below for supported options):
  :lookup => :geocoder_ca,

  # geocoding service request timeout, in seconds (default 3):
  :timeout => 5,

  # set default units to miles:
  :units => :mi,

  ip_lookup: :telize
)