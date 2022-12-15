SELECT userid, username, city FROM (SELECT users.id AS userid, 
users.name AS username, cities.name AS city FROM users JOIN cities ON 
users."cityId" = cities.id) AS result WHERE city = 'Rio de Janeiro';
