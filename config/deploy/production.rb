# server-based syntax
# ======================
# Defines a single server with a list of roles and multiple properties.
# You can define all roles on a single server, or split them:

server ENV['PROD_SERVER'], user: ENV['PROD_USER'], roles: %w{app db web}
set :deploy_to, ENV['PROD_DEPLOY_TO']
set :tmp_dir, ENV['PROD_TMP_DIR']
set :dotenv_path, ENV['PROD_ENV']
