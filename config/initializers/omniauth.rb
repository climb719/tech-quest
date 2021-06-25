#works in conjuction with our gems, gems looking for this file
#this file will process our outgoing request how app expects it to be
#won't interpret correctly if not typed in exactlt

#middleware interpret request and transform so accurate request for outside party
#instructions how to access it with provider (from google documentation to access)
#send in id and secret keys through omniauth
#access like a class ENV similar to hash, part of left is a key
#skip javascript web token to help request go through
# setting up sp when we make link to visit, we can interpret request and transform it to request to 3rd party site
Rails.application.config.middleware.use OmniAuth::Builder do
    provider :google_oauth2, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_CLIENT_SECRET'], :skip_jwt => true
end 