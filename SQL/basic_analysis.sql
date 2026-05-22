--Top 10 Drivers by Race Wins

SELECT driver,
       race_wins
FROM drivers
ORDER BY race_wins DESC
LIMIT 10;

--Drivers with Highest Podium Consistency

SELECT driver,
       podium_rate
FROM drivers
WHERE race_entries > 20
ORDER BY podium_rate DESC
LIMIT 10;

--Most Successful Nationalities

SELECT nationality,
       SUM(race_wins) AS total_wins
FROM drivers
GROUP BY nationality
ORDER BY total_wins DESC
LIMIT 10;

--Drivers with Highest Points Efficiency

SELECT driver,
       points_per_entry
FROM drivers
WHERE race_entries > 20
ORDER BY points_per_entry DESC
LIMIT 10;

--Championship Distribution by Decade

SELECT decade,
       SUM(championships) AS total_championships
FROM drivers
GROUP BY decade
ORDER BY decade;