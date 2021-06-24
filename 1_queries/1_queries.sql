SELECT *
  FROM users
 WHERE email = 'tristanjacobs@gmail.com';



SELECT AVG(end_date - start_date) as average_duration
  FROM reservations;



SELECT properties.id, properties.title, properties.cost_per_night, AVG(rating) as average_rating
  FROM properties JOIN property_reviews on properties.id = property_id
 WHERE city LIKE '%ancouv%'
 GROUP BY properties.id
HAVING AVG(rating) > 4
 ORDER BY cost_per_night
 LiMIT 10;



SELECT city, COUNT(reservations.*) as total_reservations
  FROM properties JOIN reservations ON properties.id = property_id
 GROUP BY city
 ORDER BY total_reservations DESC;



SELECT properties.id, properties.title, cost_per_night, start_date, AVG(property_reviews.rating) as average_rating
  FROM properties JOIN property_reviews ON properties.id = property_reviews.id
  JOIN reservations ON properties.id = reservations.property_id
 WHERE reservations.guest_id = 1 AND end_date < now()::date
 GROUP BY properties.id, reservations.id
 ORDER BY start_date
 LIMIT 10;