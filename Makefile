run:
    docker-compose up;
    docker-compose run app --rm sh -c "flake8"

lint:
    docker-compose run app --rm sh -c "flake8"
