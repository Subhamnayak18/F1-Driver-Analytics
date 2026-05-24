--GOAT Ranking System

SELECT driver,
    championships,
    race_wins,
    podiums,
    ROUND(
        (
            win_rate * 0.40 + podium_rate * 0.30 + pole_rate * 0.20 + points_per_entry * 0.10
        )::numeric,
        2
    ) AS goat_score
FROM drivers
WHERE race_entries > 30
ORDER BY goat_score DESC;

--Driver Tier Classification

SELECT driver,
    race_wins,
    podium_rate,
    win_rate,
    CASE
        WHEN win_rate >= AVG(win_rate) OVER ()
        AND podium_rate >= AVG(podium_rate) OVER () THEN 'Elite Driver'
        WHEN win_rate >= AVG(win_rate) OVER () THEN 'Great Driver'
        WHEN win_rate >= AVG(podium_rate) OVER () THEN 'Competitive Driver'
        ELSE 'Developing Driver'
    END AS driver_tier,
    ROUND(
        (
            win_rate * 0.40 + podium_rate * 0.30 + pole_rate * 0.20 + points_per_entry * 0.10
        )::numeric,
        2
    ) AS goat_score
FROM drivers
WHERE race_entries > 20
ORDER BY goat_score DESC;

--Ranking Drivers Within Each Decade (WINDOW FUNCTION)

SELECT driver,
    decade,
    race_wins,
    RANK() OVER(
        PARTITION BY decade
        ORDER BY race_wins DESC
    ) AS decade_rank
FROM drivers
WHERE race_wins > 0;