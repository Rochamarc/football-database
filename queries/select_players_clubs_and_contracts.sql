SELECT clubs.name, players.name, players.position, players.age, players_contract.value, players_contract.salary, players_contract.termination_fine FROM clubs INNER JOIN players_contract INNER JOIN players ON clubs.id = id_club and players.id = id_player;