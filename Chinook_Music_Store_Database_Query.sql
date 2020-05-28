/* QUERY 1: Which city placed the most orders on rock music? */
SELECT i.BillingCity, COUNT(*) as count
FROM Invoice i
JOIN InvoiceLine l
  ON i.InvoiceId = l.InvoiceId
JOIN Track t
  ON l.TrackId = t.TrackId
JOIN Genre g
  ON t.GenreId = g.GenreId
WHERE g.Name = 'Rock'
GROUP BY i.BillingCity
ORDER BY count DESC
LIMIT 10;

/* QUERY 2: What are the top 10 countries which placed the most orders on rock music? */
SELECT i.BillingCountry, COUNT(*) as count
FROM Invoice i
JOIN InvoiceLine l
  ON i.InvoiceId = l.InvoiceId
JOIN Track t
  ON l.TrackId = t.TrackId
JOIN Genre g
  ON t.GenreId = g.GenreId
WHERE g.Name = 'Rock'
GROUP BY i.BillingCountry
ORDER BY count DESC
LIMIT 10;

/* QUERY 3: Who are our best customers? */
SELECT DISTINCT
  c.Email,
  c.FirstName,
  c.LastName,
  g.Name,
  COUNT(*) count
FROM Customer c
JOIN Invoice i
  ON i.CustomerId = c.CustomerId
JOIN InvoiceLine l
  ON i.InvoiceId = l.InvoiceId
JOIN Track t
  ON l.TrackId = t.TrackId
JOIN Genre g
  ON t.GenreId = g.GenreId
WHERE g.Name = 'Rock'
GROUP BY Email
ORDER BY count DESC, Email;

/* QUERY 4: Which artist should we invite? */
SELECT
  ar.ArtistId,
  ar.Name,
  COUNT(*) AS Songs
FROM Track t
JOIN Genre g
  ON t.GenreId = g.GenreId
JOIN Album al
  ON t.AlbumId = al.AlbumId
JOIN Artist ar
  ON al.ArtistId = ar.ArtistId
WHERE g.Name = 'Rock'
GROUP BY ar.ArtistId
ORDER BY Songs DESC;