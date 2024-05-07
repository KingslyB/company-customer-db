--AUTHOR: Kingsly Bude

USE dbRaceVenue;

--Renaming the 'REG_IS_PAID' column inside the 'REGISTRATION' table to 'EARLY_BIRD' 
EXEC sp_rename 'REGISTRATION.REG_IS_PAID', 'EARLY_BIRD', 'COLUMN';


--Adding a table to the REGISTRATION TABLE that holds the amount paid on a registration record
ALTER TABLE REGISTRATION
ADD AMOUNT_PAID SMALLMONEY NOT NULL DEFAULT(0) ;