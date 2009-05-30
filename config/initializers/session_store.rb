# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_rex_raid_session',
  :secret      => 'dcf8ab6618775b8553667f6e8ae6a28fb7897df7e9ce162870c43aab46875d6394b87ef18119dcd8a6236fb630e9a51ec27714b0051b41eabb45682055843df7'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
