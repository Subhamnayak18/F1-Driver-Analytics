--Champion vs Non-Champion Performance Comparison

SELECT 
       CASE
           WHEN champion = 'TRUE' THEN 'Champion'
           ELSE 'Non-Champion'
       END AS driver_type,
        COUNT(*) AS total_drivers,
        ROUND(AVG(race_wins)::numeric,2) AS avg_race_wins,
        ROUND(AVG(championships)::numeric,2) AS avg_championships,
        ROUND(AVG(win_rate)::numeric,2) AS avg_win_rate,
        ROUND(AVG(podium_rate)::numeric,2) AS avg_podium_rate,
        ROUND(AVG(points_per_entry)::numeric,2) AS avg_points_per_entry,
        ROUND(AVG(pole_rate)::numeric,2) AS avg_pole_rate
FROM drivers
GROUP BY driver_type
ORDER BY avg_win_rate DESC;

--Drivers with High Win Rate but Low Championships

SELECT driver,
       championships,
       win_rate,
       race_wins
FROM drivers
WHERE championships = 0
ORDER BY win_rate DESC;

--Most Efficient Champions

SELECT driver,
       championships,
       race_entries,
       ROUND((championships::numeric / race_entries) * 100,2) AS championship_efficiency
FROM drivers
WHERE championships > 0
ORDER BY championship_efficiency DESC
LIMIT 10;

--Decade-wise Driver Performance Trends

SELECT decade,
       ROUND(AVG(win_rate)::numeric,2) AS avg_win_rate,
       ROUND(AVG(points_per_entry)::numeric,2) AS avg_points,
       ROUND(AVG(podium_rate)::numeric,2) AS avg_podium_rate
FROM drivers
GROUP BY decade
ORDER BY decade;

--Drivers with Exceptional Consistency

SELECT driver,
       race_entries,
       podium_rate,
       fastlap_rate
FROM drivers
WHERE race_entries > 100
ORDER BY podium_rate DESC,race_entries DESC;

