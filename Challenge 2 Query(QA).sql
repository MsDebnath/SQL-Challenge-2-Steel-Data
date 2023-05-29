/*1. What are the names of the players whose salary is greater than 100,000?*/

SELECT player_name, salary
FROM players
WHERE salary > 100000
ORDER BY salary DESC;

/*2. What is the team name of the player with player_id = 3?*/

SELECT p.player_id, t.team_name
FROM players p 
	INNER JOIN teams t USING(team_id)
WHERE p.player_id = 3;

/*3. What is the total number of players in each team?*/

SELECT p.team_id, t.team_name, 
	COUNT(*) AS Total_players
FROM players p
	INNER JOIN teams t USING(team_id)
GROUP BY p.team_id, t.team_name;

/*4. What is the team name and captain name of the team with team_id = 2?*/

SELECT p.team_id, t.team_name, 
	p.player_name AS captain_name 
FROM players p
	INNER JOIN teams t USING(team_id)
WHERE p.team_id = 2 
	AND p.player_id = t.captain_id;

/*5. What are the player names and their roles in the team with team_id = 1?*/

SELECT team_id, player_name, role
FROM players
WHERE team_id = 1;

/*6. What are the team names and the number of matches they have won?*/

CREATE VIEW MW AS (
	SELECT winner_id, COUNT(*) AS matches_won
    FROM matches
    GROUP BY winner_id
    );
    
SELECT t.team_name, m.matches_won
FROM teams t
	INNER JOIN MW m ON t.team_id = m.winner_id
ORDER BY m.matches_won DESC;

/*7. What is the average salary of players in the teams with country 'USA'?*/

SELECT t.team_name, 
	ROUND(AVG(p.salary),2) AS Average_salary
FROM players p
	INNER JOIN teams t USING(team_id)
WHERE t.country = "USA"
GROUP BY t.team_name;

/*8. Which team won the most matches?*/

SELECT t.team_name, m.matches_won
FROM teams t
	INNER JOIN MW m ON t.team_id = m.winner_id
ORDER BY m.matches_won DESC
LIMIT 1;

/*9. What are the team names and the number of players in each team whose salary is greater than 100,000?*/

SELECT t.team_name, 
	COUNT(*) AS number_of_players
FROM players P
	INNER JOIN teams t USING(team_id)
WHERE p.salary > 100000
GROUP BY t.team_name
ORDER BY number_of_players DESC;

/*10. What is the date and the score of the match with match_id = 3?*/

SELECT match_id, match_date, 
	score_team1, score_team2, 
	(score_team1 + score_team2) AS total_score
FROM matches
WHERE match_id = 3;


















