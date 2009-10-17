# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_stater_session',
  :secret      => 'dd3f31c93ad17e7f203992fc8669275d68a348affd4f88d5627d95b3f7c2fba78b0b473cb44189a63ee35c20ecf6d436d5b44afe8bd7c0aa8a83039fea83fae8'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
