/*
 * Count number of tweets that use #coronavirus
 */
select count(*)
from tweets_jsonb
where tags LIKE '%#coronavirus%';
