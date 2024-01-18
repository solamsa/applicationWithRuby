# Define the default target
.DEFAULT_GOAL := help

# Define the help target
help:
	@echo "Available targets:"
	@echo "run: make test        -To run tests"
	@echo "run: make run         -To run the app"

# Define the test target
test:
	@echo "Running all tests inside the project"
	@echo "Running user authentication tests"
	rspec spec/features/user_authentication_spec.rb
	@echo "Running find movie tests"
	rspec spec/features/find_movie_spec.rb 
	@echo "Running adding movie to favourites tests"
	rspec spec/features/add_to_favourite_spec.rb 
	@echo "Running saving movie to db tests"
	rspec spec/features/save_movie_spec.rb 
	@echo "Running movie rating tests"
	rspec spec/features/rate_movie_spec.rb
	@echo "Running rating model tests"
	rspec spec/models/movie_spec.rb
	@echo "Running movie model tests"
	rspec spec/models/movie_spec.rb 
	@echo "Running rating model tests"
	rspec spec/models/rating_spec.rb
	
run:
	@echo "Running the app"
	ruby main_app.rb