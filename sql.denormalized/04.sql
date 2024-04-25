/*
 * Count the number of English tweets containing the word "coronavirus"
 */
select count(*) as count
from tweets_jsonb
where
    to_tsvector('english', COALESCE(data->'extended_tweet'->>'full_text', data->>'text'))@@to_tsquery('english', 'coronavirus')
    AND data->>'lang' = 'en';
