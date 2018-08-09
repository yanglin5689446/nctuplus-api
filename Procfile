release: cp config/database.yml.example config/database.yml && bin/rails db:create && bin/rails db:migrate && bin/rake db:seed
web: bin/rails server -p $PORT
