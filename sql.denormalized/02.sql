/*
 * Calculates the hashtags that are commonly used with the hashtag #coronavirus
 */

select '#' || (jsonb_array_elements(COALESCE(data->'entities'->'hashtags','[]') ||
                COALESCE(data->'extended_tweet'->'entities'->'hashtags','[]'))->>'text'::TEXT) AS tag, count(distinct data->>'id')
from tweets_jsonb
where
    data->'entities'->'hashtags' @> '[{"text": "coronavirus"}]'
    or data->'extended_tweet'->'entities'->'hashtags' @> '[{"text": "coronavirus"}]'
group by tag
order by count desc, tag
limit 1000;

