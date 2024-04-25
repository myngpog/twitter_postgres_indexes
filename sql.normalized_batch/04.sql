/*
 * Count the number of English tweets containing the word "coronavirus"
 */
select count(*) as count
from tweets
where to_tsvector('english',text)@@to_tsquery('english','coronavirus') and lang='en';
