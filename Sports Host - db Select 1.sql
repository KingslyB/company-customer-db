--AUTHOR: Kingsly Bude
USE dbSportsHost


--Selecting REC and COMP players who have not paid at least $125 and $300 respectively
SELECT PlayerID,
	PlayerFirst + PlayerLast AS "Player Name",
	FeesPaid
FROM tblRecPlayers
WHERE FeesPaid < 125

UNION ALL
SELECT PlayerID,
	PlayerFirst + PlayerLast AS "Player Name",
	FeesPaid
FROM tblCompPlayers
WHERE FeesPaid < 300;


--Selecting players that are both players for the REC and COMP team
SELECT PlayerFirst + PlayerLast AS "Player Name"
FROM tblRecPlayers
INTERSECT
SELECT PlayerFirst + PlayerLast AS "Player Name"
FROM tblCompPlayers


-- Selecting players that have fees outstanding and how much is left to be paid. Ordered by the highest outstanding fee
SELECT PlayerID,
	PlayerFirst + PlayerLast AS "Player Name",
	FeesPaid,
	125 - FeesPaid AS "Fees Outstanding"
FROM tblRecPlayers
WHERE FeesPaid != 125
UNION
SELECT PlayerID,
	PlayerFirst + PlayerLast AS "Player Name",
	FeesPaid,
	300 - FeesPaid AS "Fees Outstanding"
FROM tblCompPlayers
WHERE FeesPaid != 300
ORDER BY "Fees Outstanding" DESC 
