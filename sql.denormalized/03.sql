/*
 * Calculates the languages that use the hashtag #coronavirus
 */
select lang, count(distinct id) as count
from (
    select
        data->>'lang' as lang,
        data->>'id' as id
    from tweets_jsonb
    where 
        data->'entities'->'hashtags' @> '[{"text": "coronavirus"}]'
        or data->'extended_tweet'->'entities'->'hashtags' @> '[{"text": "coronavirus"}]'
) as t
group by lang
order by count desc, lang;
