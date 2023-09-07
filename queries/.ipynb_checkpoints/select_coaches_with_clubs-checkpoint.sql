SELECT coaches.name, coaches.formation, coaches.play_mode, coaches_contract.salary, clubs.name FROM coaches INNER JOIN coaches_contract INNER JOIN clubs ON coaches.id = coaches_contract.id_coach AND clubs.id = coaches_contract.id_club;

-- based on tournament code
SELECT coaches.id, coaches.name, coaches.nationality, coaches.formation, coaches.play_mode, clubs.id, clubs.name 
FROM  coaches 
    INNER JOIN coaches_contract 
    INNER JOIN clubs 
        ON coaches.id = coaches_contract.id_coach 
        AND clubs.id = coaches_contract.id_club;