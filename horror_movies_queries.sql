-- =============================================
-- Horror Movie Analysis Project 
-- Author: China Trimble 
-- Tool: CVSFiddle SQL 
-- Date: 2026 
-- =============================================

-- Objective:
-- Analyze horror movies to determine what factors 
-- contribute to higher ratings and audience engagement.

-- =============================================
-- Query 1: View Full Dataset
-- Purpose: Understand structure and columns
-- =============================================
SELECT *
FROM "Horror Movies"
LIMIT 10;

-- =============================================
-- Query 2: Filter Popular Horror Movies
-- Purpose: Extract only horror-related films
-- =============================================
SELECT *
FROM "Horror Movies"
WHERE genre LIKE '%Horror%'

-- =============================================
-- Query 3: Filter Popular Horror Movies
-- Purpose: Keep only well-reviewed horror films
-- =============================================
SELECT *
FROM "Horror Movies"
WHERE genre LIKE '%Horror%'
AND vote_count >= 2000
ORDER BY vote_average DESC;

-- =============================================
-- Query 4: Average Rating of Horror Movies
-- Purpose: Understand overall performance of horror films 
-- =============================================
SELECT 
    avg(vote_average) AS avg_horror_rating
FROM "Horror Movies"
WHERE genre LIKE '%Horror%';

-- =============================================
-- Query 5: Genre Combination Performance 
-- Purpose: Identify top-performing horror sub-genres 
-- =============================================
SELECT 
    genre,
    AVG(vote_average) AS avg_rating,
    AVG(vote_count) AS avg_votes
FROM "Horror Movies" 
WHERE genre LIKE '%Horror%'
AND vote_count >= 2000
GROUP BY genre
ORDER BY avg_rating DESC 
LIMIT 10;
