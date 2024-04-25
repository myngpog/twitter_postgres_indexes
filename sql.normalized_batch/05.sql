/*
 * Calculates the hashtags that are commonly used for English tweets containing the word "coronavirus"
 */
select
    tag,
    count(*) AS count
from (
    select distinct
        id_tweets,
        tag
    from tweets
    join tweet_tags using (id_tweets)
    where to_tsvector('english',text)@@to_tsquery('english','coronavirus') and lang='en'
) as t
group by tag
order by count desc,tag
limit 1000;
