SELECT competition_tables.matches, competition_tables.won, competition_tables.draw, competition_tables.lost,
competition_tables.goals_for, competition_tables.goals_away, competition_tables.goal_diff, clubs.name
FROM competition_tables
INNER JOIN clubs
    ON competition_tables.id_club = clubs.id
WHERE competition_tables.id_competition = 1 AND competition_tables.id_divison = 1;