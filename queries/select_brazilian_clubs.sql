select clubs.id, clubs.name, clubs.country, clubs.class, clubs.coeff, confederations.name, confederations.continent from clubs INNER JOIN confederations ON id_confederation = confederations.id where clubs.country = 'Brazil';